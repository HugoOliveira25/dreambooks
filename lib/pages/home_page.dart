import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/services/livro_service.dart';
import 'package:dreambooks/widgets/genero.dart';
import 'package:dreambooks/widgets/livro.dart';
import 'package:flutter/material.dart';

import 'detalhes_livro_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttonLabels = [
    "ROMANCE",
    "BIOGRAFIA",
    "LT INFANTIL",
    "RELIGIOSO"
  ];

  List<LivroModel> livrosRomance = [];
  List<LivroModel> livrosLtInfantil = [];

  void obterTodosLivros() async {
    // Chame o serviço de autenticação aqui
    final livroService = LivroService();
    try {
      var livros = await livroService.obterTodosLivros();
      setState(() {
        livrosRomance = livros.where((w) => w.genero == "Romance ").toList();
        livrosLtInfantil =
            livros.where((w) => w.genero == "Literatura infantil").toList();
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    obterTodosLivros();

    return Scaffold(
      backgroundColor: const Color(0xFFE8E0DD),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text(''),
          backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
          elevation: 0.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50, left: 130, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: buttonLabels.length,
                itemBuilder: (context, index) {
                  return Genero(
                    text: buttonLabels[index],
                    onPressed: () {},
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'ROMANCE',
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetalhesLivroPage(
                                    livro: livrosRomance[index],
                                  ),
                                ),
                              );
                            },
                            child: Livro(book: livrosRomance[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    'LITERATURA INFANTIL',
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
                        itemCount: livrosLtInfantil.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetalhesLivroPage(
                                    livro: livrosLtInfantil[index],
                                  ),
                                ),
                              );
                            },
                            child: Livro(book: livrosLtInfantil[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
