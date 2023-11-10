import 'package:http/http.dart' as http;
import '../models/cep_model.dart';
import 'dart:convert';

class ViaCepService {
  static Future<ResultCep> fetchCep(String cep) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      bool? erro = data['erro'];
      bool temErro = false;
      if (erro != null) {
        temErro = true;
      } else {
        temErro = false;
      }
      if (temErro) {
        return ResultCep(
            cep: '',
            logradouro: '',
            complemento: '',
            bairro: '',
            localidade: '',
            uf: '',
            ibge: '',
            gia: '');
      }
      return ResultCep.fromJson(response.body);
    } else {
      return ResultCep(
          cep: '',
          logradouro: '',
          complemento: '',
          bairro: '',
          localidade: '',
          uf: '',
          ibge: '',
          gia: '');
    }
  }
}
