import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/services/pedido_service.dart';
import 'package:flutter/material.dart';

import 'finalizar_pedido_page.dart';

class FormaPagamentoPage extends StatefulWidget {
  final LivroModel livro;

  const FormaPagamentoPage({super.key, required this.livro});

  @override
  State<FormaPagamentoPage> createState() => _FormaPagamentoPageState();
}

class _FormaPagamentoPageState extends State<FormaPagamentoPage> {
  String formaPagamento = '';
  final livroService = PedidoService();

  void toggleSelection(String value) {
    setState(() {
      formaPagamento = value;
    });
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'PAGAMENTO NA ENTREGA',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB27666)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () => {toggleSelection('cartao')},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: formaPagamento == 'cartao'
                            ? const Color.fromRGBO(178, 118, 102, 1.0)
                            : Colors.transparent, // Cor da borda
                        width: 2.0, // Espessura da borda
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 50,
                              child: Image.asset('lib/assets/debit-card.png')),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Cartão de Débito ou Crédito',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFB27666),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () => {toggleSelection('dinheiro')},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: formaPagamento == 'dinheiro'
                            ? const Color.fromRGBO(178, 118, 102, 1.0)
                            : Colors.transparent, // Cor da borda
                        width: 2.0, // Espessura da borda
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 50,
                              child: Image.asset('lib/assets/cash.png')),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Dinheiro',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFB27666),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: formaPagamento.isEmpty
                      ? null
                      : () async {
                          await livroService.salvarPedido(
                              widget.livro.id, formaPagamento);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FinalizarPedidoPage(),
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
                  child: const Text('Finalizar pedido',
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
