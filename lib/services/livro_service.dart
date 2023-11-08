import 'dart:convert';
import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/services/token_service.dart';
import 'package:http/http.dart' as http;

class LivroService {
  static const String apiUrl = 'http://18.231.43.77/api/books/stock';

  Future<List<LivroModel>> obterTodosLivros() async {
    final tokenService = AuthenticationService();

    var token = await tokenService.getToken();

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json', 'token': token.toString()},
    );

    if (response.statusCode == 200) {
      List<LivroModel> livros = (json.decode(response.body)['data'] as List)
          .map((livro) => LivroModel.fromJson(livro))
          .toList();

      return livros;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }
}
