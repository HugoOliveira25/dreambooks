import 'dart:convert';
import 'package:dreambooks/services/token_service.dart';
import 'package:http/http.dart' as http;

class PedidoService {
  static const String apiUrl = 'http://18.231.43.77/api/order/';

  Future<dynamic> salvarPedido(String idLivro, String formaPagamento) async {
    final tokenService = AuthenticationService();

    var dataDevolucao = DateTime.now().add(const Duration(days: 7));

    final Map<String, dynamic> dadosLogin = {
      "id_usuario": await tokenService.getIdUsuario(),
      "observacao": "",
      "id_endereco": "1",
      "forma_pagamento": formaPagamento,
      "data": DateTime.now().toString(),
      "dataDevolucao": dataDevolucao.toString(),
      "qtd_itens": "1",
      "itens": [
        {
          "id_livro": idLivro,
          "quantidade": 1,
          "observacao": "",
        }
      ]
    };

    var token = await tokenService.getToken();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json', 'token': token.toString()},
      body: jsonEncode(dadosLogin),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }
}
