import 'package:dreambooks/pages/home_page.dart';
import 'package:flutter/material.dart';

class FinalizarPedidoPage extends StatelessWidget {
  const FinalizarPedidoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4d1ca),
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 300),
                    child: Image.asset(
                      'lib/assets/logo.png',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.30),
                  child: Container(
                    color: const Color(0xffe4d1ca),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 200),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              child: Image.asset(
                                'lib/assets/book-cart.png',
                              ),
                            ),
                            const SizedBox(
                              width: 250,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: 15.0, top: 10.0),
                                child: Text(
                                  'SEU PEDIDO FOI FINALIZADO COM SUCESSO!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFFB27666)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                'VOCÊ TERÁ UM PRAZO DE 15 DIAS APÓS A CHEGADA DO LIVRO!!!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFFB27666)),
                              ),
                            ),
                            const Text(
                              'Assim que seu prazo terminar  um motoboy será enviado em seu endereço para a devolução, obrigado por utilizar nosso serviços!!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFB27666)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFB27666),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  minimumSize: const Size(200, 50),
                                ),
                                child: const Text('Voltar para home',
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
        ),
      ),
    );
  }
}
