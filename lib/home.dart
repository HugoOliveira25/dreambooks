import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/widgets/genero.dart';
import 'package:dreambooks/widgets/livro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> buttonLabels = [
    "ROMANCE",
    "BIOGRAFIA",
    "LT INFANTIL",
    "RELIGIOSO"
  ];

  final List<LivroModel> livrosRomance = [
    LivroModel(
        title: 'Eu e esse meu coração',
        imageUrl: 'lib/assets/eu_e_esse_meu_coracao.jpg'),
    LivroModel(
        title: 'É assim que acaba',
        imageUrl: 'lib/assets/e_assim_que_acaba.jpg'),
    LivroModel(
        title: 'Vermelho Branco e Sangue Azul ',
        imageUrl: 'lib/assets/verm_branc_sangue_azul.jpg'),
  ];

  final List<LivroModel> livrosLtInfantil = [
    LivroModel(
        title: 'Diário de um banana',
        imageUrl: 'lib/assets/diario_de_um_banana.jpg'),
    LivroModel(
        title: 'O pequeno principe',
        imageUrl: 'lib/assets/o_pequeno_principe.jpg'),
    LivroModel(
        title: 'Turma da Monica', imageUrl: 'lib/assets/turma_da_monica.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
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
                          return Livro(book: livrosRomance[index]);
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
                          return Livro(book: livrosLtInfantil[index]);
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
