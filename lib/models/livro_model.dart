class LivroModel {
  String id = '';
  String titulo = '';
  String autor = '';
  String publi = '';
  String editora = '';
  String genero = '';
  String iSBN = '';
  String descricao = '';
  String quantidade = '';
  String capa = '';

  LivroModel(
      {required this.id,
      required this.titulo,
      required this.autor,
      required this.publi,
      required this.editora,
      required this.genero,
      required this.iSBN,
      required this.descricao,
      required this.quantidade,
      required this.capa});

  LivroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['Titulo'];
    autor = json['Autor'];
    publi = json['Publi'];
    editora = json['Editora'];
    genero = json['Genero'];
    iSBN = json['ISBN'];
    descricao = json['Descricao'];
    quantidade = json['Quantidade'];
    capa = json['Capa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Titulo'] = titulo;
    data['Autor'] = autor;
    data['Publi'] = publi;
    data['Editora'] = editora;
    data['Genero'] = genero;
    data['ISBN'] = iSBN;
    data['Descricao'] = descricao;
    data['Quantidade'] = quantidade;
    data['Capa'] = capa;
    return data;
  }
}
