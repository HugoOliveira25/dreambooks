import 'package:dreambooks/services/endereco_service.dart';
import 'package:dreambooks/widgets/endereco.dart';
import 'package:flutter/material.dart';
import '../models/endereco_model.dart';

class EnderecoPage extends StatefulWidget {
  const EnderecoPage({super.key});

  @override
  State<EnderecoPage> createState() => _EnderecoPage();
}

class _EnderecoPage extends State<EnderecoPage> {
  List<EnderecoModel> enderecos = [];

  obterEnderecos() async {
    final enderecoService = EnderecoService();
    var result = await enderecoService.obterEnderecos();
    setState(() {
      enderecos = result;
    });
  }

  @override
  void initState() {
    super.initState();
    obterEnderecos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E0DD),
      appBar: AppBar(
        title: const Text('Endereços'),
        backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFE8E0DD),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: enderecos.length,
            itemBuilder: (context, index) {
              return Endereco(endereco: enderecos[index]);
            },
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
