import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/widgets/genero.dart';
import 'package:dreambooks/widgets/livro.dart';
import 'package:flutter/material.dart';

import 'detalhes_livro_page.dart';

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
        imageUrl: 'lib/assets/eu_e_esse_meu_coracao.jpg',
        autor: 'Hunter, C. C',
        anoPublicacao: '2018',
        descricao:
            'Leah MacKenzie, de 17 anos, não tem coração. O que a mantém viva é um coração artificial que ela carrega dentro de uma mochila. Com seu tipo sanguíneo raro, um transplante é como um sonho distante. Conformada, ela tenta se esquecer de que está com os dias contados, criando uma lista de “coisas para fazer antes de morrer”. De repente, Leah recebe uma segunda chance: há um coração disponível!'),
    LivroModel(
        title: 'É assim que acaba',
        imageUrl: 'lib/assets/e_assim_que_acaba.jpg',
        autor: 'Collen Hoover',
        anoPublicacao: '2016',
        descricao:
            'Lily, uma jovem que se mudou de uma cidadezinha do Maine para Boston, se formou em marketing e abriu a própria floricultura. E é em um dos terraços de Boston que ela conhece Ryle, um neurocirurgião confiante, teimoso e talvez até um pouco arrogante, com uma grande aversão a relacionamentos, mas que se sente muito atraído por ela. Quando os dois se apaixonam, Lily se vê no meio de um relacionamento turbulento que não é o que ela esperava. Mas será que ela conseguirá enxergar isso, por mais doloroso que seja? É assim que acaba é uma narrativa poderosa sobre a força necessária para fazer as escolhas certas nas situações mais difíceis. Considerada a obra mais pessoal de Hoover, o livro aborda sem medo alguns tabus da sociedade para explorar a complexidade das relações tóxicas, e como o amor e o abuso muitas vezes coexistem em uma confusão de sentimentos.'),
    LivroModel(
        title: 'Vermelho Branco e Sangue Azul',
        imageUrl: 'lib/assets/verm_branc_sangue_azul.jpg',
        autor: 'Hunter, C. C',
        anoPublicacao: '2018',
        descricao:
            'Leah MacKenzie, de 17 anos, não tem coração. O que a mantém viva é um coração artificial que ela carrega dentro de uma mochila. Com seu tipo sanguíneo raro, um transplante é como um sonho distante. Conformada, ela tenta se esquecer de que está com os dias contados, criando uma lista de “coisas para fazer antes de morrer”. De repente, Leah recebe uma segunda chance: há um coração disponível! O problema é quando ela descobre que o doador é um garoto da sua escola – e que supostamente se matou! Matt, o irmão gêmeo do doador, se recusa a acreditar que Eric se suicidou. Quando Leah o procura, eles descobrem que ambos têm sonhos semelhantes que podem ter pistas do que realmente aconteceu a Eric. Enquanto tentam desvendar esse mistério, Matt e Leah se apaixonam e não querem correr o risco de perder um ao outro. Mas nem a vida nem um coração transplantado vem com garantias. Quem diria que viver exige mais coragem do que morrer?'),
  ];

  final List<LivroModel> livrosLtInfantil = [
    LivroModel(
        title: 'Diário de um banana',
        imageUrl: 'lib/assets/diario_de_um_banana.jpg',
        autor: 'Hunter, C. C',
        anoPublicacao: '2018',
        descricao:
            'Leah MacKenzie, de 17 anos, não tem coração. O que a mantém viva é um coração artificial que ela carrega dentro de uma mochila. Com seu tipo sanguíneo raro, um transplante é como um sonho distante. Conformada, ela tenta se esquecer de que está com os dias contados, criando uma lista de “coisas para fazer antes de morrer”. De repente, Leah recebe uma segunda chance: há um coração disponível! O problema é quando ela descobre que o doador é um garoto da sua escola – e que supostamente se matou! Matt, o irmão gêmeo do doador, se recusa a acreditar que Eric se suicidou. Quando Leah o procura, eles descobrem que ambos têm sonhos semelhantes que podem ter pistas do que realmente aconteceu a Eric. Enquanto tentam desvendar esse mistério, Matt e Leah se apaixonam e não querem correr o risco de perder um ao outro. Mas nem a vida nem um coração transplantado vem com garantias. Quem diria que viver exige mais coragem do que morrer?'),
    LivroModel(
        title: 'O pequeno principe',
        imageUrl: 'lib/assets/o_pequeno_principe.jpg',
        autor: 'Hunter, C. C',
        anoPublicacao: '2018',
        descricao:
            'Leah MacKenzie, de 17 anos, não tem coração. O que a mantém viva é um coração artificial que ela carrega dentro de uma mochila. Com seu tipo sanguíneo raro, um transplante é como um sonho distante. Conformada, ela tenta se esquecer de que está com os dias contados, criando uma lista de “coisas para fazer antes de morrer”. De repente, Leah recebe uma segunda chance: há um coração disponível! O problema é quando ela descobre que o doador é um garoto da sua escola – e que supostamente se matou! Matt, o irmão gêmeo do doador, se recusa a acreditar que Eric se suicidou. Quando Leah o procura, eles descobrem que ambos têm sonhos semelhantes que podem ter pistas do que realmente aconteceu a Eric. Enquanto tentam desvendar esse mistério, Matt e Leah se apaixonam e não querem correr o risco de perder um ao outro. Mas nem a vida nem um coração transplantado vem com garantias. Quem diria que viver exige mais coragem do que morrer?'),
    LivroModel(
        title: 'Turma da Monica',
        imageUrl: 'lib/assets/turma_da_monica.jpg',
        autor: 'Hunter, C. C',
        anoPublicacao: '2018',
        descricao:
            'Leah MacKenzie, de 17 anos, não tem coração. O que a mantém viva é um coração artificial que ela carrega dentro de uma mochila. Com seu tipo sanguíneo raro, um transplante é como um sonho distante. Conformada, ela tenta se esquecer de que está com os dias contados, criando uma lista de “coisas para fazer antes de morrer”. De repente, Leah recebe uma segunda chance: há um coração disponível! O problema é quando ela descobre que o doador é um garoto da sua escola – e que supostamente se matou! Matt, o irmão gêmeo do doador, se recusa a acreditar que Eric se suicidou. Quando Leah o procura, eles descobrem que ambos têm sonhos semelhantes que podem ter pistas do que realmente aconteceu a Eric. Enquanto tentam desvendar esse mistério, Matt e Leah se apaixonam e não querem correr o risco de perder um ao outro. Mas nem a vida nem um coração transplantado vem com garantias. Quem diria que viver exige mais coragem do que morrer?'),
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
                              child: Livro(book: livrosRomance[index]));
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
