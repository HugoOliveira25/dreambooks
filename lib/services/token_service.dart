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

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(tokenKey);
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }
}
