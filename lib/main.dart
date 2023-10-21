import 'package:flutter/material.dart';

import 'pages/cadastro_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Rota inicial
      title: 'Dream Books',
      routes: {
        '/login': (context) => const LoginPage(), // Rota inicial
        '/cadastro': (context) => const CadastroPage(), // Rota da cadastro
        '/home': (context) => HomePage(), // Rota da home
      },
      home: const MyHomePage(title: 'Dream Books'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(
                      'lib/assets/logo.png',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 250),
                  child: Text(
                    'SEJA BEM-VINDO!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Color.fromRGBO(232, 224, 221, 1.0),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 207, 176, 166),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('LOGIN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 207, 176, 166),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('CADASTRAR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
