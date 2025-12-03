import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String? origem;

  const HomeScreen({super.key, this.origem});

  @override
  Widget build(BuildContext context) {
    // Equivalente ao cálculo da mensagem no React
    final String mensagem = origem == "cadastro"
        ? 'Conta criada com sucesso. Que sua playlist interior comece a tocar.'
        : 'Login realizado. O palco é seu.';

    return Scaffold(
      backgroundColor: const Color(0xFF04151F),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bem-vindo ao Orpheus",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  color: Color(0xFFEFD6AC),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                mensagem,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC44900),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
