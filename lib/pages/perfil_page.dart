import 'package:dreambooks/services/token_service.dart';
import 'package:flutter/material.dart';

import '../models/livro_model.dart';
import '../services/livro_service.dart';
import '../widgets/livro.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  List<LivroModel> livrosRomance = [];

  String nomeUsuario = "";
  String emailUsuario = "";

  void obterTodosLivros() async {
    final authService = AuthenticationService();
    var nome = await authService.getNomeUsuario();
    var email = await authService.getEmailUsuario();
    nomeUsuario = nome.toString();
    emailUsuario = email.toString();

    final livroService = LivroService();
    try {
      var livros = await livroService.obterTodosLivros();
      setState(() {
        livrosRomance = livros.where((w) => w.genero == "Romance ").toList();
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    obterTodosLivros();
    return Scaffold(
      backgroundColor: const Color(0xFFE8E0DD),
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              color: const Color.fromRGBO(178, 118, 102, 1.0),
              height: 200.0,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('lib/assets/logo.png'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    nomeUsuario,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    emailUsuario,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 25),
                        child: Text(
                          'MEUS FAVORITOS',
                          style: TextStyle(
                              color: Color(0xFFB27666),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          color: Colors.white,
                          height: 205,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: livrosRomance.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Livro(
                                      book: livrosRomance[index],
                                      showDisponivel: false),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/perfil-editar');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB27666),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('EDITAR PERFIL',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
