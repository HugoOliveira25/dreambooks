import 'dart:convert';
import 'package:dreambooks/services/token_service.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String apiUrl = 'http://18.231.43.77/api/login';

  Future<String> fazerLogin(String email, String senha) async {
    final Map<String, String> dadosLogin = {
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
      final tokenService = AuthenticationService();
      var data = json.decode(response.body);
      String token = data['data']['token'];
      String idUsuario = data['data']['id'];
      String emailUsuario = data['data']['email'];
      await tokenService.setToken(token);
      await tokenService.setIdUsuario(idUsuario);
      await tokenService.setEmailUsuario(emailUsuario);
      return token;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }
}
