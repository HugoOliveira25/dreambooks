import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/pages/forma_pagamento_page.dart';
import 'package:dreambooks/services/cep_service.dart';
import 'package:dreambooks/services/endereco_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/token_service.dart';

class FecharPedidoPage extends StatefulWidget {
  final LivroModel livro;

  const FecharPedidoPage({super.key, required this.livro});

  @override
  State<FecharPedidoPage> createState() => _FecharPedidoPageState();
}

class _FecharPedidoPageState extends State<FecharPedidoPage> {
  final _searchCepController = TextEditingController();
  final _ruaController = TextEditingController();
  final _numeroController = TextEditingController();
  final _bairroCepController = TextEditingController();
  final _cidadeCepController = TextEditingController();
  final _ufCepController = TextEditingController();
  final _cepController = TextEditingController();
  final _estadoController = TextEditingController();

  bool _loading = false;
  bool _enableField = true;
  String _result = "";
  bool enderecoEncontrado = false;
  double precoAluguel = 0;
  bool favorito = false;
  List<String>? idsLivrosFavoritos = [];

  final localStorageService = AuthenticationService();

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
        _ufCepController.text = resultCep.uf;
        _cepController.text = resultCep.cep;
        _estadoController.text = resultCep.uf;
        enderecoEncontrado = true;
      } else {
        showErrorDialog(context, 'CEP não encontrado');
        enderecoEncontrado = false;
      }
      _result = resultCep.toJson();
    });
    _searching(false);
  }

  Future salvarEndereco() async {
    final enderecoService = EnderecoService();
    await enderecoService.inserirEndereco(
        _ruaController.text,
        _numeroController.text,
        _bairroCepController.text,
        _cidadeCepController.text.replaceAll("'", ""),
        _ufCepController.text,
        _cepController.text,
        _estadoController.text);
  }

  obterFavoritos() async {
    idsLivrosFavoritos = await localStorageService.getLivroFavorito();

    setState(() {
      if (idsLivrosFavoritos != null) {
        for (var element in idsLivrosFavoritos!) {
          if (element == widget.livro.id) {
            favorito = true;
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchCepController.clear();
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      precoAluguel = 10;

      obterFavoritos();
    });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30, top: 10),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          favorito = !favorito;
                        });
                        if (favorito) {
                          await localStorageService
                              .setLivroFavorito(widget.livro.id);
                        } else {
                          await localStorageService
                              .removerLivroFavorito(widget.livro.id);
                        }
                      },
                      child: favorito
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                              size: 30,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.pink,
                              size: 30,
                            ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    child: Image.network(
                      widget.livro.capa,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  formatarMoeda(precoAluguel),
                  style: const TextStyle(
                    fontSize: 26,
                    color: Color.fromRGBO(178, 118, 102, 1.0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 3.0, right: 8.0, left: 8.0, bottom: 8.0),
                      child: _loading
                          ? _circularLoading()
                          : const Text(
                              'DIGITE SEU ENDEREÇO (CEP):', // Texto do rótulo
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(178, 118, 102,
                                    1.0), // Estilo do rótulo, se necessário
                              ),
                            ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 50, left: 50, bottom: 5),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8,
                                  top: 5,
                                  left: 50,
                                ),
                                child: Text(
                                  'RUA',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(178, 118, 102, 1.0),
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
                          )
                        : const Text(''),
                    enderecoEncontrado
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    bottom: 8, top: 5, left: 50),
                                child: Text(
                                  'NÚMERO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(178, 118, 102, 1.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 50, left: 50),
                                child: TextField(
                                  controller: _numeroController,
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
                          )
                        : const Text(''),
                    enderecoEncontrado
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8,
                                  top: 8,
                                  left: 50,
                                ),
                                child: Text(
                                  'BAIRRO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(178, 118, 102, 1.0),
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
                          )
                        : const Text(''),
                    enderecoEncontrado
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 8,
                                  top: 8,
                                  left: 50,
                                ),
                                child: Text(
                                  'CIDADE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(178, 118, 102, 1.0),
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
                          )
                        : const Text(''),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: enderecoEncontrado
                      ? () async {
                          await salvarEndereco();
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

String formatarMoeda(double valor) {
  var formatador = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatador.format(valor);
}
