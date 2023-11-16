class EnderecoModel {
  String id = '';
  String rua = '';
  String id_usuario = '';
  String cidade = '';
  String bairro = '';
  String estado = '';
  String numero = '';
  String complemento = '';
  String cep = '';
  String uf = '';
  String principal = '';

  EnderecoModel(
      {required this.id,
      required this.rua,
      required this.id_usuario,
      required this.cidade,
      required this.bairro,
      required this.estado,
      required this.numero,
      required this.complemento,
      required this.cep,
      required this.uf,
      required this.principal});

  EnderecoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rua = json['rua'];
    id_usuario = json['id_usuario'];
    cidade = json['cidade'];
    bairro = json['bairro'];
    estado = json['estado'];
    numero = json['numero'];
    complemento = json['complemento'];
    cep = json['cep'];
    uf = json['uf'];
    principal = json['principal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rua'] = rua;
    data['id_usuario'] = id_usuario;
    data['cidade'] = cidade;
    data['bairro'] = bairro;
    data['estado'] = estado;
    data['numero'] = numero;
    data['complemento'] = complemento;
    data['cep'] = cep;
    data['uf'] = uf;
    data['principal'] = principal;
    return data;
  }
}
