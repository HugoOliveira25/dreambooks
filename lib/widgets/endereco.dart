import 'package:flutter/material.dart';
import '../models/endereco_model.dart';
import '../services/endereco_service.dart';
import '../services/token_service.dart';

class Endereco extends StatefulWidget {
  final EnderecoModel endereco;

  Endereco({super.key, required this.endereco});

  @override
  State<Endereco> createState() => _EnderecoState();
}

class _EnderecoState extends State<Endereco> {
  final Color colorPadrao = const Color(0xFFB27666);

  final tokenService = AuthenticationService();

  Future<String> excluirEndereco(BuildContext context) async {
    final tokenService = AuthenticationService();

    var enderecoId = await tokenService.getEnderecoId();

    final cadastroService = EnderecoService();
    try {
      var endereco =
          await cadastroService.excluirEndereco(enderecoId.toString());
      showSucessoDialog(context, "Endereço excluído com sucesso");
      return "";
    } catch (e) {
      // Lidar com erros de login aqui
      print('Erro durante o login: $e');
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFB27666), width: 1)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.endereco.principal == '1' ? "Principal" : "",
                    style: TextStyle(color: colorPadrao),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: InkWell(
                          onTap: () {
                            tokenService.setEnderecoId(widget.endereco.id);
                            Navigator.pushNamed(context, '/endereco-editar');
                          },
                          child: Icon(
                            Icons.edit,
                            color: colorPadrao,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          tokenService.setEnderecoId(widget.endereco.id);
                          excluirEndereco(context);
                        },
                        child: Icon(
                          Icons.delete,
                          color: colorPadrao,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "${widget.endereco.rua}, ${widget.endereco.numero}",
                  style: TextStyle(color: colorPadrao, fontSize: 20),
                ),
                subtitle: Text(
                  "${widget.endereco.bairro}, ${widget.endereco.cidade} - ${widget.endereco.uf}",
                  style: TextStyle(color: colorPadrao, fontSize: 16),
                ),
              ),
            )
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
        title: const Text('Excluir endereço'),
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
