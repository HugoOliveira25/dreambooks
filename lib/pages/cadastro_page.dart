import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Stack(
                children: [
                  Transform.scale(
                    scale: 1.65,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 300),
                      child: Image.asset(
                        'lib/assets/logo.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 190),
                    child: Container(
                      color: const Color(0xffe4d1ca),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 8,
                                      top: 8,
                                      right: 180,
                                    ),
                                    child: Text(
                                      'DIGITE SEU NOME:', // Texto do rótulo
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(
                                              0xFF8F8E8E) // Estilo do rótulo, se necessário
                                          ),
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          16.0, 12.0, 16.0, 12.0),
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
                                    cursorColor: Colors.black,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 8,
                                      top: 8,
                                      right: 195,
                                    ),
                                    child: Text(
                                      'DIGITE SEU CPF:', // Texto do rótulo
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(
                                              0xFF8F8E8E) // Estilo do rótulo, se necessário
                                          ),
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          16.0, 12.0, 16.0, 12.0),
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
                                    cursorColor: Colors.black,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 8,
                                        top: 8,
                                        right: 170,
                                      ),
                                      child: Text(
                                        'DIGITE SUA E-MAIL:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF8F8E8E)),
                                      ),
                                    ),
                                    TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                16.0, 12.0, 16.0, 12.0),
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
                                      cursorColor: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 8,
                                        top: 8,
                                        right: 170,
                                      ),
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
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                16.0, 12.0, 16.0, 12.0),
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
                                      cursorColor: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 8,
                                        top: 8,
                                        right: 150,
                                      ),
                                      child: Text(
                                        'CONFIRME SUA SENHA:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF8F8E8E)),
                                      ),
                                    ),
                                    TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                16.0, 12.0, 16.0, 12.0),
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
                                      cursorColor: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: ElevatedButton(
                                  onPressed: () {},
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
          );
        },
      ),
    );
  }
}
