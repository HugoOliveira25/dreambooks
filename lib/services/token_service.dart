import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  static const String tokenKey = 'token';

  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  Future<void> setIdUsuario(String idUsuario) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('id_usuario', idUsuario);
  }

  Future<String?> getIdUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('id_usuario');
  }

  Future<void> setNomeUsuario(String nomeUsuario) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome_usuario', nomeUsuario);
  }

  Future<String?> getNomeUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('nome_usuario');
  }

  Future<void> setTelefoneUsuario(String telefoneUsuario) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('telefone_usuario', telefoneUsuario);
  }

  Future<String?> getTelefoneUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('telefone_usuario');
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  Future<void> setEmailUsuario(String nomeUsuario) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email_usuario', nomeUsuario);
  }

  Future<String?> getEmailUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email_usuario');
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }
}
