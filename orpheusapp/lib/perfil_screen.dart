import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key, required this.usuario});

  final Map<String, dynamic> usuario; // <-- CORRIGIDO!

  // Estatísticas para exemplo
  final Map<String, dynamic> estatisticas = const {
    "Logs": 25,
    "seguidores": 120,
    "seguindo": 80,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil de ${usuario['nome'] ?? 'Usuário'}"), // <-- Exibe nome
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // --- Estatísticas ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                statItem(estatisticas["Logs"], "Logs"),
                statItem(estatisticas["seguidores"], "Seguidores"),
                statItem(estatisticas["seguindo"], "Seguindo"),
              ],
            ),

            const SizedBox(height: 20),

            // --- Avaliação com estrela ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                int nota = 3; // Exemplo
                return Icon(
                  FontAwesomeIcons.solidStar,
                  size: 16,
                  color: i < nota ? Colors.amber : Colors.grey,
                );
              }),
            ),

            const SizedBox(height: 40),

            // --- Mostrar informações do usuário ---
            Text(
              "Email: ${usuario['email'] ?? ''}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Nome: ${usuario['nome'] ?? ''}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Função para montar um item de estatística
  Widget statItem(int valor, String titulo) {
    return Column(
      children: [
        Text(
          valor.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(titulo),
      ],
    );
  }
}
