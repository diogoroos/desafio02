import 'dart:convert';

class ProfissionalModel {
  String nomeProfissional = "";
  String titulo = "";
  ProfissionalModel({
    required this.nomeProfissional,
    required this.titulo,
  });

  ProfissionalModel.empty({this.nomeProfissional = '', this.titulo = ''});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'nomeProfissional': nomeProfissional});
    result.addAll({'titulo': titulo});

    return result;
  }

  factory ProfissionalModel.fromMap(Map<String, dynamic> map) {
    return ProfissionalModel(
      nomeProfissional: map['nomeProfissional'] ?? '',
      titulo: map['titulo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfissionalModel.fromJson(String source) =>
      ProfissionalModel.fromMap(json.decode(source));
}
