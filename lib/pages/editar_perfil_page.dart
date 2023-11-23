import 'package:flutter/material.dart';

import '../services/cadastro_service.dart';
import '../services/token_service.dart';

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({super.key});

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPage();
}

class _EditarPerfilPage extends State<EditarPerfilPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();

  Future<String> alterarUsuario() async {
    final String nome = nomeController.text;
    final String telefone = telefoneController.text;

    if (nome.isEmpty || telefone.isEmpty) {
      showErrorDialog(context, 'Preencha todos os campos');
      return "";
    }

    final cadastroService = CadastroService();
    try {
      return await cadastroService.alterarUsuario(nome, telefone);
    } catch (e) {
      showErrorDialog(context, 'Ocorreu um erro ao salvar, tente novamente');
      return "";
    }
  }

  obterDadosDoUsuario() async {
    final tokenService = AuthenticationService();
    var nome = await tokenService.getNomeUsuario();
    var telefone = await tokenService.getTelefoneUsuario();

    if (nome!.isNotEmpty) {
      nomeController.text = nome;
    }

    if (telefone!.isNotEmpty) {
      telefoneController.text = telefone;
    }
  }

  @override
  Widget build(BuildContext context) {
    obterDadosDoUsuario();
    return Scaffold(
      backgroundColor: const Color(0xFFE8E0DD),
      appBar: AppBar(
        title: const Text('Editar perfil'),
        backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: const Color.fromRGBO(178, 118, 102, 1.0),
              height: 200.0,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            AssetImage('lib/assets/foto_perfil.jpeg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 8,
                                top: 8,
                                right: 270,
                              ),
                              child: Text(
                                'NOME:', // Texto do rótulo
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF8F8E8E)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: TextField(
                                controller: nomeController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      16.0, 12.0, 16.0, 12.0),
                                  labelText: '',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFB27666),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                bottom: 8,
                                top: 8,
                                right: 250,
                              ),
                              child: Text(
                                'TELEFONE:', // Texto do rótulo
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF8F8E8E)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
                              child: TextField(
                                controller: telefoneController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      16.0, 12.0, 16.0, 12.0),
                                  labelText: '',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFB27666),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                cursorColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                      onPressed: () async {
                        var result = await alterarUsuario();
                        if (result.isEmpty)
                          return;
                        else {
                          showSucessoDialog(
                              context, "Perfil alterado com sucesso");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB27666),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('SALVAR',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
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
        title: const Text('Perfil alterado'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      );
    },
  );
}
