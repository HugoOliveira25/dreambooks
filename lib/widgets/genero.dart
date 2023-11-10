import 'package:flutter/material.dart';

import '../models/genero_model.dart';

class Genero extends StatelessWidget {
  final GeneroModel genero;
  final VoidCallback onPressed;

  const Genero({super.key, required this.genero, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 90.0, // Defina a largura desejada
          height: 30.0, // Defina a altura desejada
          decoration: BoxDecoration(
            border: genero.ativo
                ? Border.all(
                    width: 2.0,
                    color: const Color(0xFFB27666),
                  )
                : null,
          ),
          child: Center(
            child: Text(
              genero.descricao,
              style: const TextStyle(
                  color: Color(0xFFB27666),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
