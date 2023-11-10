import 'package:flutter/material.dart';
import '../models/livro_model.dart';

class Livro extends StatelessWidget {
  final LivroModel book;
  final bool showDisponivel;

  const Livro({super.key, required this.book, required this.showDisponivel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: showDisponivel ? 0 : 12),
      child: Card(
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 120,
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 140,
                    child: Image.network(
                      book.capa,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: showDisponivel
                        ? const Text('Disponível',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w500))
                        : null,
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
