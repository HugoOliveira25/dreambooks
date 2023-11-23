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
  List<LivroModel> livrosFavoritos = [];
  List<String> notasLista = [];
  final authService = AuthenticationService();

  String nomeUsuario = "";
  String emailUsuario = "";

  void obterLivrosFavoritos() async {
    var nome = await authService.getNomeUsuario();
    var email = await authService.getEmailUsuario();
    nomeUsuario = nome.toString();
    emailUsuario = email.toString();

    final livroService = LivroService();
    try {
      var livros = await livroService.obterTodosLivros();
      var idsLivrosFavoritos = await authService.getLivroFavorito();

      if (idsLivrosFavoritos != null) {
        setState(() {
          for (var element in livros) {
            for (var id in idsLivrosFavoritos) {
              if (id == element.id) {
                livrosFavoritos.add(element);
              }
            }
          }
        });
      }

      var notas = await authService.getNotas();

      if (notas != null) {
        setState(() {
          notasLista = notas;
        });
      }
    } catch (e) {}
  }

  void obterNotas() async {
    try {
      var notas = await authService.getNotas();

      if (notas != null) {
        setState(() {
          notasLista = notas;
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    obterLivrosFavoritos();
  }

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
                      backgroundImage:
                          AssetImage('lib/assets/foto_perfil.jpeg'),
                    ),
                  ),
                  const SizedBox(height: 10.0),
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
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: livrosFavoritos.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: livrosFavoritos.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {},
                                        child: Livro(
                                            book: livrosFavoritos[index],
                                            showDisponivel: false),
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text('Nenhum livro favorito!')),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/notas');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB27666),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('ADICIONAR NOTA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: notasLista.isNotEmpty
                        ? const Text(
                            'Notas',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(178, 118, 102, 1.0),
                            ),
                          )
                        : null,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: notasLista.isNotEmpty
                          ? Container(
                              height: 400,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: notasLista.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color.fromRGBO(178,
                                                118, 102, 1.0), // Cor da borda
                                            width: 2.0, // Espessura da borda
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: Text(
                                                    notasLista[index],
                                                    style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          178, 118, 102, 1.0),
                                                    ),
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await authService
                                                        .removerNota(
                                                            notasLista[index]);
                                                    setState(() {
                                                      obterNotas();
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Color.fromRGBO(
                                                        178, 118, 102, 1.0),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
