import 'package:dreambooks/models/livro_model.dart';
import 'package:flutter/material.dart';

class FormaPagamentoPage extends StatelessWidget {
  final LivroModel livro;

  const FormaPagamentoPage({super.key, required this.livro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E0DD),
      appBar: AppBar(
        title: const Text('Forma de pagamento'),
        backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 70,
                        child: Image.asset('lib/assets/credit-card.png')),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Cartão de crédito',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB27666)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 70,
                        child: Image.asset('lib/assets/debit-card.png')),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Cartão de débito',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB27666)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 70, child: Image.asset('lib/assets/cash.png')),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Dinheiro',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB27666)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
