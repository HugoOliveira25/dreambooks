import 'package:dreambooks/models/livro_model.dart';
import 'package:flutter/material.dart';

class AdicionarCartaoPage extends StatelessWidget {
  final LivroModel livro;

  const AdicionarCartaoPage({super.key, required this.livro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar cartão'),
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
                  child: Image.network(
                    livro.capa,
                  ),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB27666),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('FORMA DE PAGAMENTO',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB27666),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: const Size(200, 50),
                  ),
                  child: const Text('FINALIZAR PEDIDO',
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
