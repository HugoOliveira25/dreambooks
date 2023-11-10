import 'package:flutter/material.dart';

import '../services/login_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  Future<String> fazerLogin(BuildContext context) async {
    final String email = emailController.text;
    final String senha = senhaController.text;

    // Chame o serviço de autenticação aqui
    final authService = AuthService();
    try {
      return await authService.fazerLogin(email, senha);
    } catch (e) {
      showErrorDialog(context, 'E-mail ou senha inválidos');
      // Lidar com erros de login aqui
      print('Erro durante o login: $e');
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.27),
                    child: Image.asset(
                      'lib/assets/logo.png',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.34),
                  child: Container(
                    color: const Color(0xffe4d1ca),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 20,
                            left: 20,
                            top: 20,
                            bottom: screenHeight * 0.11),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 30),
                                  child: Text('Login',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0XFF7D7B7B),
                                          fontWeight: FontWeight.w900)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'DIGITE SEU E-MAIL:', // Texto do rótulo
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(
                                            0xFF8F8E8E) // Estilo do rótulo, se necessário
                                        ),
                                  ),
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: '',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          50.0), // Define o raio das bordas
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      borderSide: const BorderSide(
                                        color: Color(
                                            0xFFB27666), // Cor da borda quando o campo está em foco
                                        width:
                                            2.0, // Espessura da borda quando o campo está em foco
                                      ),
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'DIGITE SUA SENHA:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8F8E8E)),
                                    ),
                                  ),
                                  TextField(
                                    controller: senhaController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: '',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            50.0), // Define o raio das bordas
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFB27666),
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () async {
                                var token = await fazerLogin(context);
                                if (token.isNotEmpty) {
                                  Navigator.pushNamed(context, '/home');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB27666),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: const Size(200, 50),
                              ),
                              child: const Text('ENTRAR',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Erro ao logar'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
