import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(bottom: 300),
                    child: Image.asset(
                      'lib/assets/logo.png',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: Container(
                    color: const Color(0xffe4d1ca),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50),
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
                                    'DIGITE SEU EM-MAIL:', // Texto do rótulo
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(
                                            0xFF8F8E8E) // Estilo do rótulo, se necessário
                                        ),
                                  ),
                                ),
                                TextField(
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
                                          color: Color(
                                              0xFFB27666), // Cor da borda quando o campo está em foco
                                          width:
                                              2.0, // Espessura da borda quando o campo está em foco
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
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Login realizado com sucesso!'),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFB27666),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: const Size(200, 50),
                              ),
                              child: const Text('Entrar',
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
