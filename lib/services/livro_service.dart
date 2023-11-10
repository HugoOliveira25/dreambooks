import 'dart:convert';
import 'package:dreambooks/models/livro_model.dart';
import 'package:dreambooks/services/token_service.dart';
import 'package:http/http.dart' as http;

class LivroService {
  static const String apiUrlTodos = 'http://18.231.43.77/api/books/stock';
  static const String apiUrlTituloAutor = 'http://18.231.43.77/api/books';

  Future<List<LivroModel>> obterTodosLivros() async {
    final tokenService = AuthenticationService();

    var token = await tokenService.getToken();

    final response = await http.get(
      Uri.parse(apiUrlTodos),
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

  Future<List<LivroModel>> obterLivroPorTituloOuAutor(String texto) async {
    final tokenService = AuthenticationService();

    var token = await tokenService.getToken();

    String apiUrlQuery = '$apiUrlTituloAutor/$texto';

    final response = await http.get(
      Uri.parse(apiUrlQuery),
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
