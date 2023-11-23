import 'package:dreambooks/services/endereco_service.dart';
import 'package:flutter/material.dart';
import '../services/token_service.dart';

class EnderecoEditarPage extends StatefulWidget {
  EnderecoEditarPage({super.key});

  @override
  State<EnderecoEditarPage> createState() => _EnderecoEditarPageState();
}

class _EnderecoEditarPageState extends State<EnderecoEditarPage> {
  final TextEditingController ruaController = TextEditingController();

  final TextEditingController numeroController = TextEditingController();

  final TextEditingController bairroController = TextEditingController();

  final TextEditingController cidadeController = TextEditingController();

  final TextEditingController ufSenhaController = TextEditingController();

  Future alterarEndereco(BuildContext context) async {
    final String rua = ruaController.text;
    final String numero = numeroController.text;
    final String bairro = bairroController.text;
    final String cidade = cidadeController.text;
    final String uf = ufSenhaController.text;

    if (rua.isEmpty ||
        numero.isEmpty ||
        bairro.isEmpty ||
        cidade.isEmpty ||
        uf.isEmpty) {
      showErrorDialog(context, 'Preencha todos os campos');
    }

    final tokenService = AuthenticationService();

    var enderecoId = await tokenService.getEnderecoId();

    final cadastroService = EnderecoService();
    try {
      return await cadastroService.alterarEndereco(
          enderecoId.toString(), rua, numero, bairro, cidade, uf);
    } catch (e) {
      showErrorDialog(context, 'E-mail ou senha inválidos');
      // Lidar com erros de login aqui
      print('Erro durante o login: $e');
    }
  }

  Future<String> obterEndereco(BuildContext context) async {
    final tokenService = AuthenticationService();

    var enderecoId = await tokenService.getEnderecoId();

    final cadastroService = EnderecoService();
    try {
      var endereco = await cadastroService.obterEndereco(enderecoId.toString());

      var enderecoModel = endereco.first;
      ruaController.text = enderecoModel.rua;
      numeroController.text = enderecoModel.numero;
      bairroController.text = enderecoModel.bairro;
      cidadeController.text = enderecoModel.cidade;
      ufSenhaController.text = enderecoModel.uf;

      return "";
    } catch (e) {
      showErrorDialog(context, 'E-mail ou senha inválidos');
      // Lidar com erros de login aqui
      print('Erro durante o login: $e');
      return "";
    }
  }

  @override
  void initState() {
    obterEndereco(context);
    super.initState();
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
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.70,
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
                                        'RUA:', // Texto do rótulo
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color(
                                                0xFF8F8E8E) // Estilo do rótulo, se necessário
                                            ),
                                      ),
                                    ),
                                    TextField(
                                      controller: ruaController,
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
                                        'NÚMERO:', // Texto do rótulo
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Color(
                                                0xFF8F8E8E) // Estilo do rótulo, se necessário
                                            ),
                                      ),
                                    ),
                                    TextField(
                                      controller: numeroController,
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
                                          'BAIRRO:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF8F8E8E)),
                                        ),
                                      ),
                                      TextField(
                                        controller: bairroController,
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
                                          'CIDADE:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF8F8E8E)),
                                        ),
                                      ),
                                      TextField(
                                        controller: cidadeController,
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
                                          'UF:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF8F8E8E)),
                                        ),
                                      ),
                                      TextField(
                                        controller: ufSenhaController,
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
                                      await alterarEndereco(context);
                                      showSucessoDialog(context,
                                          "Endereço alterado com sucesso.");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFB27666),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      minimumSize: const Size(200, 50),
                                    ),
                                    child: const Text('ALTERAR ENDEREÇO',
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
        title: const Text('Erro ao alterar endereço'),
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
        title: const Text('Endereço alterado'),
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
