import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  String erro = "";

  // ====== FUNÇÃO DE LOGIN (EQUIVALENTE AO loginUser) ======
  Future<Map<String, dynamic>?> loginUser(String email, String senha) async {
    // Aqui você vai implementar usando seu banco no Flutter
    // Exemplo fictício:
    if (email == "teste@teste.com" && senha == "123") {
      return {"id": 1, "username": "Teste"};
    }
    return null;
  }

  // ====== FUNÇÃO ESPIÃO (EQUIVALENTE ao getAllUsers) ======
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    // Exemplo fictício:
    return [
      {"id": 1, "username": "Teste", "password": "123"}
    ];
  }

  // ====== LÓGICA DO BOTÃO ENTRAR ======
  Future<void> handleLogin() async {
    final email = emailController.text;
    final senha = senhaController.text;

    if (email.isEmpty || senha.isEmpty) {
      setState(() => erro = "Preencha todos os campos.");
      return;
    }

    setState(() => erro = "");

    final usuario = await loginUser(email, senha);

    if (usuario != null) {
      // Redireciona para Boas Vindas
      Navigator.pushNamed(
        context,
        "/boasvindas",
        arguments: {
          "origem": "login",
          "usuario": usuario,
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Acesso Negado"),
          content: const Text("Usuário ou senha incorretos."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    }
  }

  // ====== BOTÃO ESPIÃO ======
  Future<void> handleEspiao() async {
    final lista = await getAllUsers();

    if (lista.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Espião"),
          content: const Text("O banco de dados está vazio."),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
          ],
        ),
      );
      return;
    }

    final texto = lista
        .map((u) =>
            "ID: ${u['id']} | User: ${u['username']} | Senha: ${u['password']}")
        .join("\n\n");

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("🕵️ Usuários Cadastrados"),
        content: Text(texto),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04151F),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),

            // Título
            const Text(
              "Entrar",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEFD6AC),
                fontFamily: "Serif",
              ),
            ),

            const SizedBox(height: 40),

            // Campo de Email
            TextField(
              controller: emailController,
              style: const TextStyle(color: Color(0xFFEFD6AC)),
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: const TextStyle(color: Color(0xFFEFD6AC)),
                filled: true,
                fillColor: const Color(0xFF183A37),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Campo de Senha
            TextField(
              controller: senhaController,
              obscureText: true,
              style: const TextStyle(color: Color(0xFFEFD6AC)),
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: const TextStyle(color: Color(0xFFEFD6AC)),
                filled: true,
                fillColor: const Color(0xFF183A37),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Erro
            if (erro.isNotEmpty)
              Text(
                erro,
                style: const TextStyle(
                  color: Color(0xFFFF6F61),
                  fontStyle: FontStyle.italic,
                ),
              ),

            const SizedBox(height: 20),

            // Botão Entrar
            ElevatedButton(
              onPressed: handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC44900),
                foregroundColor: const Color(0xFF04151F),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: const BorderSide(color: Color(0xFF432534)),
              ),
              child: const Text(
                "Entrar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Link cadastro
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/cadastro"),
              child: const Text(
                "Não tem conta? Crie agora",
                style: TextStyle(
                  color: Color(0xFFEFD6AC),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 50),

            // Área de debug
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFF183A37)),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    "Área de Desenvolvimento",
                    style: TextStyle(
                      color: Color(0xFF183A37),
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Botão espião
                  OutlinedButton(
                    onPressed: handleEspiao,
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(color: Color(0xFFEFD6AC), width: 1),
                      backgroundColor: const Color(0xFF2A1A1F),
                    ),
                    child: const Text(
                      "🕵️ Ver Usuários (Espião)",
                      style: TextStyle(
                        color: Color(0xFFEFD6AC),
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
