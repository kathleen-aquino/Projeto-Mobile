import 'package:flutter/material.dart';
import 'perfil_screen.dart';

class BoasVindasScreen extends StatefulWidget {
  final String origem;
  final Map< String, dynamic> usuario;

  const BoasVindasScreen({
    super.key,
    required this.origem,
    required this.usuario,
  });

  @override
  State<BoasVindasScreen> createState() => _BoasVindasScreenState();
}

class _BoasVindasScreenState extends State<BoasVindasScreen> {

  @override
  void initState() {
    super.initState();

    // Equivalente ao useEffect com setTimeout
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PerfilScreen(usuario: widget.usuario),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    // Mensagem equivalente ao ternário do React Native
    final String mensagem = widget.origem == "cadastro"
        ? "Conta criada com sucesso. Que sua playlist interior comece a tocar."
        : "Login realizado. O palco é seu.";

    return Scaffold(
      backgroundColor: const Color(0xFF04151F),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
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
                  fontFamily: "serif",
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
