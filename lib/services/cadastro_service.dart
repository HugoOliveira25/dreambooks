import 'dart:convert';
import 'package:dreambooks/services/token_service.dart';
import 'package:http/http.dart' as http;

class CadastroService {
  static const String apiUrl = 'http://18.231.43.77/api/user';

  Future<String> cadastrarUsuario(
      String nome, String email, String cpf, String senha) async {
    final Map<String, String> dadosLogin = {
      "nome": nome,
      "cpf": cpf,
      "email": email,
      "senha": senha,
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(dadosLogin),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      String token = data['data']['token'];
      return token;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }
}
