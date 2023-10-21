import 'package:dreambooks/models/livro_model.dart';
import 'package:flutter/material.dart';

import 'fechar_pedido_page.dart';

class DetalhesLivroPage extends StatelessWidget {
  final LivroModel livro;

  const DetalhesLivroPage({super.key, required this.livro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E0DD),
      appBar: AppBar(
        title: const Text(''),
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
                padding: const EdgeInsets.only(top: 40.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: Image.asset(
                    livro.imageUrl,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70, top: 15),
                child: ListTile(
                  title: Center(
                      child: Text(
                    livro.title,
                    style: const TextStyle(
                      color: Color(0xFFB27666),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  )),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Text(
                        livro.autor,
                        style: const TextStyle(
                          color: Color(0xFFB27666),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      )),
                      Center(
                          child: Text(
                        livro.anoPublicacao,
                        style: const TextStyle(
                          color: Color(0xFFB27666),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Center(
                    child: Text(
                  livro.descricao,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFFB27666),
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FecharPedidoPage(
                          livro: livro,
                        ),
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
                  child: const Text('Fazer pedido',
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
    );
  }
}
