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

  Future<void> setEnderecoId(String enderecoId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('endereco_id', enderecoId);
  }

  Future<String?> getEnderecoId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('endereco_id');
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }

  Future<void> setLivroFavorito(String livroId) async {
    final prefs = await SharedPreferences.getInstance();

    var idsLivrosFavoritos = await getLivroFavorito();

    if (idsLivrosFavoritos != null && idsLivrosFavoritos.isNotEmpty) {
      var existemItem =
          idsLivrosFavoritos.where((element) => element == livroId);
      if (existemItem.isEmpty) {
        idsLivrosFavoritos.add(livroId);
        await prefs.setStringList('ids_livros', idsLivrosFavoritos);
      }
    } else {
      List<String> novaLista = [];
      novaLista.add(livroId);
      await prefs.setStringList('ids_livros', novaLista);
    }
  }

  Future<void> removerLivroFavorito(String livroId) async {
    final prefs = await SharedPreferences.getInstance();

    var idsLivrosFavoritos = await getLivroFavorito();

    if (idsLivrosFavoritos != null && idsLivrosFavoritos.isNotEmpty) {
      var existemItem =
          idsLivrosFavoritos.firstWhere((element) => element == livroId);

      if (existemItem != '') {
        idsLivrosFavoritos.remove(existemItem);
        await prefs.setStringList('ids_livros', idsLivrosFavoritos);
      }
    } else {
      var novaLista = List<String>.empty();
      await prefs.setStringList('ids_livros', novaLista);
    }
  }

  Future<void> setNota(String nota) async {
    final prefs = await SharedPreferences.getInstance();

    var notas = await getNotas();

    if (notas != null && notas.isNotEmpty) {
      notas.add(nota);
      await prefs.setStringList('notas', notas);
    } else {
      List<String> novaLista = [];
      novaLista.add(nota);
      await prefs.setStringList('notas', novaLista);
    }
  }

  Future<void> removerNota(String nota) async {
    final prefs = await SharedPreferences.getInstance();

    var notas = await getNotas();

    if (notas != null && notas.isNotEmpty) {
      var existemItem = notas.where((element) => element == nota);

      if (existemItem.isNotEmpty) {
        notas.remove(existemItem.first);
        await prefs.setStringList('notas', notas);
      }
    } else {
      var novaLista = List<String>.empty();
      await prefs.setStringList('notas', novaLista);
    }
  }

  Future<List<String>?> getLivroFavorito() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('ids_livros');
  }

  Future<List<String>?> getNotas() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('notas');
  }
}
