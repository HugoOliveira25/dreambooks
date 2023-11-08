import 'package:flutter/material.dart';
import '../models/livro_model.dart';

class Livro extends StatelessWidget {
  final LivroModel book;

  const Livro({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  // child: Image.asset(
                  //   book.capa,
                  // ),
                  child: Text(book.autor),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text('Disponível',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
