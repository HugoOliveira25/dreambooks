import 'package:flutter/material.dart';

import '../services/token_service.dart';

class NotasPage extends StatefulWidget {
  const NotasPage({super.key});

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  final TextEditingController notaController = TextEditingController();
  final storage = AuthenticationService();

  bool disableButton = true;

  @override
  void initState() {
    super.initState();
    notaController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    notaController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (notaController.text.isNotEmpty) {
      setState(() {
        disableButton = false;
      });
    } else {
      setState(() {
        disableButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe4d1ca),
      appBar: AppBar(
        title: const Text('Notas'),
        backgroundColor: const Color.fromRGBO(178, 118, 102, 1.0),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: notaController,
              maxLines: null,
              // Define maxLines como null para permitir várias linhas
              decoration: const InputDecoration(
                focusColor: Color.fromRGBO(178, 118, 102, 1.0),
                hintText: 'Digite seu texto aqui...',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFB27666),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ElevatedButton(
              onPressed: !disableButton
                  ? () async {
                      var texto = notaController.text;
                      await storage.setNota(texto);
                      Navigator.pushNamed(context, '/home');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB27666),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('SALVAR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      )),
    );
  }
}
