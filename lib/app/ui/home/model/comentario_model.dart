import 'dart:convert';

class ComentarioModel {
  String texto = "";
  String email = "";
  int estrelas = 0;
  ComentarioModel({
    required this.texto,
    required this.email,
    required this.estrelas,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'texto': texto});
    result.addAll({'email': email});
    result.addAll({'estrelas': estrelas});
    return result;
  }

  factory ComentarioModel.fromMap(Map<String, dynamic> map) {
    return ComentarioModel(
      texto: map['texto'] ?? '',
      email: map['email'] ?? '',
      estrelas: map['estrelas']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComentarioModel.fromJson(String source) =>
      ComentarioModel.fromMap(json.decode(source));
}
