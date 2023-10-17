import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          title: const Text(''),
          backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
          elevation: 0.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 50, left: 100, right: 20),
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
      body: Column(
        children: <Widget>[
          Container(
            height: 100, // Altura do cabeçalho
            child: ListView(
              scrollDirection:
                  Axis.horizontal, // Define a direção como horizontal
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Lógica do botão 1
                  },
                  child: const Text('Botão 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica do botão 2
                  },
                  child: const Text('Botão 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica do botão 3
                  },
                  child: const Text('Botão 3'),
                ),
                // Adicione mais botões conforme necessário
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Conteúdo da Página'),
            ),
          ),
        ],
      ),
    );
  }
}
