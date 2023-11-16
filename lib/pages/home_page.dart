import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/services/livro_service.dart';
import 'package:dreambooks/widgets/genero.dart';
import 'package:dreambooks/widgets/livro.dart';
import 'package:flutter/material.dart';

import '../models/genero_model.dart';
import '../services/token_service.dart';
import 'detalhes_livro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<GeneroModel> buttonLabels = [
    GeneroModel(descricao: "ROMANCE", ativo: false),
    GeneroModel(descricao: "BIOGRAFIA", ativo: false),
    GeneroModel(descricao: "LT INFANTIL", ativo: false),
    GeneroModel(descricao: "RELIGIOSO", ativo: false)
  ];

  final TextEditingController _textController = TextEditingController();

  List<LivroModel> livrosRomance = [];
  List<LivroModel> livrosLtInfantil = [];
  List<LivroModel> livrosBiografia = [];
  List<LivroModel> livrosReligioso = [];
  bool ocultarRomance = false;
  bool ocultarLtInfatil = false;
  bool ocultarBiografia = false;
  bool ocultarReligioso = false;
  String nomeUsuario = "";
  String emailUsuario = "";

  void obterTodosLivros() async {
    final livroService = LivroService();
    try {
      var livros = await livroService.obterTodosLivros();
      setState(() {
        livrosRomance = livros.where((w) => w.genero == "Romance ").toList();
        livrosLtInfantil =
            livros.where((w) => w.genero == "Literatura infantil").toList();
        livrosBiografia = livros.where((w) => w.genero == "Biografia").toList();
        livrosReligioso = livros.where((w) => w.genero == "Religioso").toList();
      });
    } catch (e) {}
  }

  void obterLivroPorTituloOuAutor(String texto) async {
    final livroService = LivroService();
    try {
      var livros = await livroService.obterLivroPorTituloOuAutor(texto);
      setState(() {
        livrosRomance = livros.where((w) => w.genero == "Romance ").toList();
        livrosLtInfantil =
            livros.where((w) => w.genero == "Literatura infantil").toList();
        livrosBiografia = livros.where((w) => w.genero == "Biografia").toList();
        livrosReligioso = livros.where((w) => w.genero == "Religioso").toList();
      });
    } catch (e) {}
  }

  selectGenero(String genero) {
    switch (genero) {
      case 'ROMANCE':
        for (var item in buttonLabels) {
          if (item.descricao == 'ROMANCE') {
            item.ativo = !item.ativo;
            if (item.ativo) {
              ocultarRomance = false;
              ocultarLtInfatil = true;
              ocultarBiografia = true;
              ocultarReligioso = true;
            } else {
              ocultarLtInfatil = false;
              ocultarBiografia = false;
              ocultarReligioso = false;
            }
          } else {
            item.ativo = false;
            ocultarRomance = false;
          }
        }
        break;
      case 'BIOGRAFIA':
        for (var item in buttonLabels) {
          if (item.descricao == 'BIOGRAFIA') {
            item.ativo = !item.ativo;
            if (item.ativo) {
              ocultarBiografia = false;
              ocultarLtInfatil = true;
              ocultarRomance = true;
              ocultarReligioso = true;
            } else {
              ocultarLtInfatil = false;
              ocultarRomance = false;
              ocultarReligioso = false;
            }
          } else {
            item.ativo = false;
            ocultarBiografia = false;
          }
        }
        break;
      case 'LT INFANTIL':
        for (var item in buttonLabels) {
          if (item.descricao == 'LT INFANTIL') {
            item.ativo = !item.ativo;
            if (item.ativo) {
              ocultarLtInfatil = false;
              ocultarRomance = true;
              ocultarBiografia = true;
              ocultarReligioso = true;
            } else {
              ocultarRomance = false;
              ocultarBiografia = false;
              ocultarReligioso = false;
            }
          } else {
            item.ativo = false;
            ocultarLtInfatil = false;
          }
        }
        break;
      case 'RELIGIOSO':
        for (var item in buttonLabels) {
          if (item.descricao == 'RELIGIOSO') {
            item.ativo = !item.ativo;
            if (item.ativo) {
              ocultarReligioso = false;
              ocultarLtInfatil = true;
              ocultarBiografia = true;
              ocultarRomance = true;
            } else {
              ocultarLtInfatil = false;
              ocultarBiografia = false;
              ocultarRomance = false;
            }
          } else {
            item.ativo = false;
            ocultarReligioso = false;
          }
        }
        break;
      default:
    }
  }

  obterDadosDoUsuario() async {
    final tokenService = AuthenticationService();
    var nome = await tokenService.getNomeUsuario();
    var email = await tokenService.getEmailUsuario();

    if (nome!.isNotEmpty) {
      nomeUsuario = nome;
    }

    if (email!.isNotEmpty) {
      emailUsuario = email;
    }
  }

  @override
  void initState() {
    super.initState();
    obterTodosLivros();
    obterDadosDoUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context, nomeUsuario, emailUsuario),
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
              child: TextField(
                controller: _textController,
                onEditingComplete: () async {
                  var texto = _textController.text;
                  setState(() {
                    obterLivroPorTituloOuAutor(texto);
                  });
                },
                decoration: const InputDecoration(
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
                    genero: buttonLabels[index],
                    onPressed: () {
                      setState(() {
                        selectGenero(buttonLabels[index].descricao);
                      });
                    },
                  );
                },
              ),
            ),
            livrosRomance.isNotEmpty && ocultarRomance == false
                ? Column(
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
                                  child: Livro(
                                      book: livrosRomance[index],
                                      showDisponivel: true),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text(''),
            livrosLtInfantil.isNotEmpty && ocultarLtInfatil == false
                ? Column(
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
                                  child: Livro(
                                      book: livrosLtInfantil[index],
                                      showDisponivel: true),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text(''),
            livrosBiografia.isNotEmpty && ocultarBiografia == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'BIOGRAFIA',
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
                              itemCount: livrosBiografia.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetalhesLivroPage(
                                          livro: livrosBiografia[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Livro(
                                      book: livrosBiografia[index],
                                      showDisponivel: true),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text(''),
            livrosReligioso.isNotEmpty && ocultarReligioso == false
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'RELIGIOSO',
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
                              itemCount: livrosReligioso.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetalhesLivroPage(
                                          livro: livrosReligioso[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Livro(
                                      book: livrosReligioso[index],
                                      showDisponivel: true),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text('')
          ],
        ),
      ),
    );
  }
}

Drawer buildDrawer(BuildContext context, String nome, String email) {
  return Drawer(
    backgroundColor: const Color(0xFFC69385),
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(nome),
          accountEmail: Text(email),
          currentAccountPicture: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('lib/assets/logo.png'),
            ),
          ),
          decoration: const BoxDecoration(color: Color(0xFFC69385)),
        ),
        ListTile(
          leading: const Icon(
            Icons.add_location_alt_outlined,
            color: Colors.white,
          ),
          title: const Text(
            'Meus Endereços',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/enderecos');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          title: const Text(
            'Perfil',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/perfil');
          },
        ),
      ],
    ),
  );
}
