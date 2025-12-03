import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:orpheusapp/database.dart';  // <-- caminho correto
import 'LoginScreen.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  String nome = "";
  String email = "";
  String senha = "";
  String confirmarSenha = "";
  String erro = "";

  // --- Função de cadastro ---
  Future<void> handleCadastro() async {
    // Validações básicas
    if (nome.isEmpty || email.isEmpty || senha.isEmpty || confirmarSenha.isEmpty) {
      setState(() => erro = "Preencha todos os campos.");
      return;
    }

    if (senha.length < 6) {
      setState(() => erro = "A senha deve ter pelo menos 6 caracteres.");
      return;
    }

    if (senha != confirmarSenha) {
      setState(() => erro = "Senhas não combinam.");
      return;
    }

    setState(() => erro = "");

    try {
      // Salvando email como username (igual ao seu RN)
      await DatabaseHelper.registerUser(email, senha);

      // ALERTA
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Conta Criada!"),
          content: Text("Bem-vindo(a), $nome. Faça login para continuar."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha alerta
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text("Ir para Login"),
            ),
          ],
        ),
      );
    } catch (e) {
      setState(() => erro = "Erro ao cadastrar. Este email pode já estar em uso.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04151F),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [

              const SizedBox(height: 40),

              const Text(
                "Criar Conta",
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xFFEFD6AC),
                  fontWeight: FontWeight.bold,
                  fontFamily: "serif",
                ),
              ),

              const SizedBox(height: 40),

              // ---------------------
              // CAMPOS DE ENTRADA
              // ---------------------

              _buildInput(
                label: "Nome",
                onChanged: (v) => setState(() => nome = v),
              ),

              _buildInput(
                label: "Email",
                onChanged: (v) => setState(() => email = v),
                keyboard: TextInputType.emailAddress,
              ),

              _buildInput(
                label: "Senha",
                onChanged: (v) => setState(() => senha = v),
                isPassword: true,
              ),

              _buildInput(
                label: "Confirmar senha",
                onChanged: (v) => setState(() => confirmarSenha = v),
                isPassword: true,
              ),

              // MENSAGEM DE ERRO
              if (erro.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    erro,
                    style: const TextStyle(
                      color: Color(0xFFFF6F61),
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              // BOTÃO CADASTRAR
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC44900),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Color(0xFF432534),
                      width: 1,
                    ),
                  ),
                  elevation: 4,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: handleCadastro,
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Color(0xFF04151F),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // BOTÃO VOLTAR
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  "Voltar",
                  style: TextStyle(
                    color: Color(0xFFEFD6AC),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------
  //   WIDGET DE INPUT
  // -------------------------
  Widget _buildInput({
    required String label,
    required void Function(String) onChanged,
    bool isPassword = false,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboard,
        obscureText: isPassword,
        style: const TextStyle(
          color: Color(0xFFEFD6AC),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: const TextStyle(color: Color(0xFFEFD6AC)),
          fillColor: const Color(0xFF183A37),
          filled: true,
          contentPadding: const EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
