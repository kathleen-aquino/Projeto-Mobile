import 'package:flutter/material.dart';

// Telas
import 'LoginScreen.dart';
import 'CadastroScreen.dart';
// ignore: unused_import
import 'perfil_screen.dart';
// ignore: unused_import
import 'BoasVindasScreen.dart';

// Se tiver banco de dados, importe aqui
// import 'database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Tela inicial
      home: const WelcomeScreen(),

      // Rotas simples (Apenas telas que NÃO recebem argumentos)
      routes: {
        '/login': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        // ❌ Não incluir '/boasvindas' porque ela recebe parâmetros
        // ❌ Não incluir '/perfil' porque também recebe parâmetros
      },
    );
  }
}

// ----------------------
//     WELCOME SCREEN
// ----------------------

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
    // initDB(); // Ative se realmente existir
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04151F),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Título
              Text(
                "Orpheus",
                style: const TextStyle(
                  fontSize: 48,
                  color: Color(0xFFEFD6AC),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 20),

              // Subtítulo
              const Text(
                "Inspirado pelo deus que encantava com sua lira.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFC44900),
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 40),

              // Botão Criar Conta
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC44900),
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Color(0xFF432534),
                      width: 1,
                    ),
                  ),
                  elevation: 4,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                child: const Text(
                  "Criar conta",
                  style: TextStyle(
                    color: Color(0xFFEFD6AC),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Botão Login
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC44900),
                  padding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Color(0xFF432534),
                      width: 1,
                    ),
                  ),
                  elevation: 4,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  "Já tenho uma conta",
                  style: TextStyle(
                    color: Color(0xFFEFD6AC),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Rodapé
              const Text(
                "Orpheus © 2025",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF432534),
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
