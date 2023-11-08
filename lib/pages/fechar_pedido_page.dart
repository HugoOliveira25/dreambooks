import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/pages/forma_pagamento_page.dart';
import 'package:flutter/material.dart';

class FecharPedidoPage extends StatelessWidget {
  final LivroModel livro;

  const FecharPedidoPage({super.key, required this.livro});

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
                padding: const EdgeInsets.only(top: 40.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  // child: Image.asset(
                  //   livro.capa,
                  // ),
                  child: Text(livro.autor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
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
                          right: 50, left: 50, bottom: 30),
                      child: TextField(
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormaPagamentoPage(
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
                  child: const Text('Selecionar forma de pagamento',
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
