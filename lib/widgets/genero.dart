import 'package:flutter/material.dart';

class Genero extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Genero({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return InkWell(
      onTap: () {
        // Ação a ser executada quando o botão for tocado.
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 90.0, // Defina a largura desejada
          height: 30.0, // Defina a altura desejada
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: const Color(0xFFB27666),
            ),
          ),
          child: Center(
            child: Text(
              text,
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
