import 'package:dreambooks/services/cadastro_service.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({super.key});

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();

  Future<String> cadastrarUsuario(BuildContext context) async {
    final String nome = nomeController.text;
    final String email = emailController.text;
    final String cpf = cpfController.text;
    final String senha = senhaController.text;
    final String confirmarSenha = confirmarSenhaController.text;

    if (nome.isEmpty ||
        email.isEmpty ||
        cpf.isEmpty ||
        senha.isEmpty ||
        confirmarSenha.isEmpty) {
      showErrorDialog(context, 'Preencha todos os campos');
      return "";
    } else if (senha != confirmarSenha) {
      showErrorDialog(context, 'Campos de senha devem ser iguais');
      return "";
    }

    final cadastroService = CadastroService();
    try {
      return await cadastroService.cadastrarUsuario(nome, email, cpf, senha);
    } catch (e) {
      showErrorDialog(context, 'E-mail ou senha inválidos');
      // Lidar com erros de login aqui
      print('Erro durante o login: $e');
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4d1ca),
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFFB27666),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Stack(
                  children: [
                    Transform.scale(
                      scale: 1.60,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.35),
                        child: Image.asset(
                          'lib/assets/logo.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.27),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        color: const Color(0xffe4d1ca),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                              left: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(bottom: 8, top: 8),
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
                                      controller: nomeController,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 8,
                                        top: 8,
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
                                      controller: cpfController,
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 8,
                                          top: 8,
                                        ),
                                        child: Text(
                                          'DIGITE SEU E-MAIL:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF8F8E8E)),
                                        ),
                                      ),
                                      TextField(
                                        controller: emailController,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 8, top: 8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 8, top: 8),
                                        child: Text(
                                          'CONFIRME SUA SENHA:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF8F8E8E)),
                                        ),
                                      ),
                                      TextField(
                                        controller: confirmarSenhaController,
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
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 10),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      var result =
                                          await cadastrarUsuario(context);
                                      if (result.isEmpty)
                                        return;
                                      else {
                                        showSucessoDialog(context,
                                            "Realize seu login na proxima tela.");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFB27666),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      minimumSize: const Size(200, 50),
                                    ),
                                    child: const Text('CADASTRAR',
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
      ),
    );
  }
}

showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Erro ao cadastrar'),
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

showSucessoDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Cadastro realizado'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      );
    },
  );
}
