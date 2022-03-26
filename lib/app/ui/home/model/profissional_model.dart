import 'dart:convert';

class ProfissionalModel {
  String nomeProfissional = "";
  String titulo = "";
  String urlPerfil = "";
  ProfissionalModel({
    this.nomeProfissional = "",
    this.titulo = "",
    this.urlPerfil = "",
  });

  ProfissionalModel.empty(
      {this.nomeProfissional = '', this.titulo = '', this.urlPerfil = ''});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nomeProfissional': nomeProfissional});
    result.addAll({'titulo': titulo});
    result.addAll({'urlPerfil': urlPerfil});

    return result;
  }

  factory ProfissionalModel.fromMap(Map<String, dynamic> map) {
    return ProfissionalModel(
      nomeProfissional: map['nomeProfissional'] ?? '',
      titulo: map['titulo'] ?? '',
      urlPerfil: map['urlPerfil'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfissionalModel.fromJson(String source) =>
      ProfissionalModel.fromMap(json.decode(source));
}
