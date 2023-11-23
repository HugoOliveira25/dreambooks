import 'dart:convert';
import 'package:dreambooks/models/endereco_model.dart';
import 'package:dreambooks/services/token_service.dart';
import 'package:http/http.dart' as http;

class EnderecoService {
  static const String apiUrl = 'http://18.231.43.77/api/address';

  Future<List<EnderecoModel>> obterEnderecos() async {
    final tokenService = AuthenticationService();

    var token = await tokenService.getToken();

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json', 'token': token.toString()},
    );

    if (response.statusCode == 200) {
      List<EnderecoModel> livros = (json.decode(response.body)['data'] as List)
          .map((livro) => EnderecoModel.fromJson(livro))
          .toList();

      return livros;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }

  Future<List<EnderecoModel>> obterEndereco(String enderecoId) async {
    final tokenService = AuthenticationService();

    var token = await tokenService.getToken();

    final response = await http.get(
      Uri.parse("$apiUrl/$enderecoId"),
      headers: {'Content-Type': 'application/json', 'token': token.toString()},
    );

    if (response.statusCode == 200) {
      List<EnderecoModel> livros = (json.decode(response.body)['data'] as List)
          .map((livro) => EnderecoModel.fromJson(livro))
          .toList();

      return livros;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }

  Future<EnderecoModel> alterarEndereco(String enderecoId, String rua,
      String numero, String bairro, String cidade, String uf) async {
    final tokenService = AuthenticationService();

    final Map<String, String> dadosEndereco = {
      "rua": rua,
      "numero": numero,
      "bairro": bairro,
      "cidade": cidade,
      "uf": uf
    };

    var token = await tokenService.getToken();

    final response = await http.patch(
      Uri.parse("$apiUrl/$enderecoId"),
      headers: {'Content-Type': 'application/json', 'token': token.toString()},
      body: jsonEncode(dadosEndereco),
    );

    if (response.statusCode == 200) {
      var endereco = EnderecoModel(
          id: json.decode(response.body)['data']['id'].toString(),
          rua: json.decode(response.body)['data']['rua'],
          id_usuario: '',
          cidade: json.decode(response.body)['data']['cidade'],
          bairro: json.decode(response.body)['data']['bairro'],
          uf: json.decode(response.body)['data']['uf'],
          numero: json.decode(response.body)['data']['numero'],
          complemento: '',
          estado: '',
          cep: '',
          principal: '');

      return endereco;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }

  Future<EnderecoModel> inserirEndereco(
      String rua,
      String numero,
      String bairro,
      String cidade,
      String uf,
      String cep,
      String estado) async {
    final tokenService = AuthenticationService();

    final Map<String, dynamic> dadosEndereco = {
      "rua": rua,
      "numero": numero,
      "cidade": cidade,
      "bairro": bairro,
      "estado": estado,
      "uf": uf,
      "complemento": "",
      "cep": cep,
      "principal": 0
    };

    var token = await tokenService.getToken();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json', 'token': token.toString()},
      body: jsonEncode(dadosEndereco),
    );

    if (response.statusCode == 200) {
      var endereco = EnderecoModel(
          id: json.decode(response.body)['data']['id'].toString(),
          rua: json.decode(response.body)['data']['rua'],
          id_usuario: '',
          cidade: json.decode(response.body)['data']['cidade'],
          bairro: json.decode(response.body)['data']['bairro'],
          uf: json.decode(response.body)['data']['uf'],
          numero: json.decode(response.body)['data']['numero'],
          complemento: '',
          estado: '',
          cep: '',
          principal: '');

      return endereco;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }

  Future<List<EnderecoModel>> excluirEndereco(String enderecoId) async {
    final tokenService = AuthenticationService();

    var token = await tokenService.getToken();

    final response = await http.delete(
      Uri.parse("$apiUrl/$enderecoId"),
      headers: {'Content-Type': 'application/json', 'token': token.toString()},
    );

    if (response.statusCode == 200) {
      List<EnderecoModel> livros = (json.decode(response.body)['data'] as List)
          .map((livro) => EnderecoModel.fromJson(livro))
          .toList();

      return livros;
    } else {
      throw Exception('Erro na solicitação: ${response.statusCode}');
    }
  }
}
