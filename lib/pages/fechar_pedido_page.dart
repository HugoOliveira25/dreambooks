import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/pages/forma_pagamento_page.dart';
import 'package:dreambooks/services/cep_service.dart';
import 'package:flutter/material.dart';

class FecharPedidoPage extends StatefulWidget {
  final LivroModel livro;

  const FecharPedidoPage({super.key, required this.livro});

  @override
  State<FecharPedidoPage> createState() => _FecharPedidoPageState();
}

class _FecharPedidoPageState extends State<FecharPedidoPage> {
  final _searchCepController = TextEditingController();
  final _ruaController = TextEditingController();
  final _bairroCepController = TextEditingController();
  final _cidadeCepController = TextEditingController();

  bool _loading = false;
  bool _enableField = true;
  String _result = "";
  bool enderecoEncontrado = false;

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _loading = enable;
      _enableField = !enable;
    });
  }

  Widget _circularLoading() {
    return const SizedBox(
      height: 15.0,
      width: 15.0,
      child: CircularProgressIndicator(),
    );
  }

  Future _searchCep() async {
    _searching(true);
    final cep = _searchCepController.text;
    final resultCep = await ViaCepService.fetchCep(cep);
    setState(() {
      if (resultCep.logradouro.isNotEmpty &&
          resultCep.bairro.isNotEmpty &&
          resultCep.localidade.isNotEmpty) {
        _ruaController.text = resultCep.logradouro;
        _bairroCepController.text = resultCep.bairro;
        _cidadeCepController.text = resultCep.localidade;
        enderecoEncontrado = true;
      } else {
        showErrorDialog(context, 'CEP não encontrado');
        enderecoEncontrado = false;
      }
      _result = resultCep.toJson();
    });
    _searching(false);
  }

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E0DD),
      appBar: AppBar(
        title: const Text('Fechar pedido'),
        backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: SizedBox(
                    height: 200,
                    child: Image.network(
                      widget.livro.capa,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _loading
                          ? _circularLoading()
                          : const Text(
                              'DIGITE SEU ENDEREÇO (CEP):', // Texto do rótulo
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(
                                      0xFF8F8E8E) // Estilo do rótulo, se necessário
                                  ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 50, left: 50, bottom: 10),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        controller: _searchCepController,
                        enabled: _enableField,
                        onEditingComplete: _searchCep,
                        decoration: InputDecoration(
                          labelText: '',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    ),
                    enderecoEncontrado
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8,
                                  top: 8,
                                  right: 220,
                                ),
                                child: Text(
                                  'RUA', // Texto do rótulo
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(
                                          0xFF8F8E8E) // Estilo do rótulo, se necessário
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 50, left: 50),
                                child: TextField(
                                  controller: _ruaController,
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
                              ),
                            ],
                          )
                        : const Text(''),
                    enderecoEncontrado
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8,
                                  top: 8,
                                  right: 200,
                                ),
                                child: Text(
                                  'BAIRRO', // Texto do rótulo
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(
                                          0xFF8F8E8E) // Estilo do rótulo, se necessário
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 50, left: 50),
                                child: TextField(
                                  controller: _bairroCepController,
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
                              ),
                            ],
                          )
                        : const Text(''),
                    enderecoEncontrado
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8,
                                  top: 8,
                                  right: 200,
                                ),
                                child: Text(
                                  'CIDADE', // Texto do rótulo
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Color(
                                          0xFF8F8E8E) // Estilo do rótulo, se necessário
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 50),
                                child: TextField(
                                  controller: _cidadeCepController,
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
                              ),
                            ],
                          )
                        : const Text(''),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: enderecoEncontrado
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormaPagamentoPage(
                                livro: widget.livro,
                              ),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB27666),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('SELECIONAR FORMA DE PAGAMENTO',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              )
            ],
          ),
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
        title: const Text('Erro ao consultar CEP'),
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
