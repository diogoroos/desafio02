import 'dart:convert';

import '../enum/tipo_pintura_enum.dart';
import 'comentario_model.dart';
import 'profissional_model.dart';

class PostModel {
  ProfissionalModel profissional = ProfissionalModel.empty();
  String descricao = "";
  String urlImagem = "";
  String pais = "";
  TipoPinturaEnum tipo = TipoPinturaEnum.gu;
  num altura = 0;
  num largura = 0;
  List<ComentarioModel> comentarios = [];
  PostModel({
    required this.profissional,
    required this.descricao,
    required this.urlImagem,
    required this.pais,
    required this.tipo,
    required this.altura,
    required this.largura,
    required this.comentarios,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      profissional: ProfissionalModel.fromMap(map['profissional']),
      descricao: map['descricao'] ?? '',
      urlImagem: map['urlImagem'] ?? '',
      pais: map['pais'] ?? '',
      tipo: localizaTipo(map['tipo']),
      altura: map['altura'] ?? 0,
      largura: map['largura'] ?? 0,
      comentarios: List<ComentarioModel>.from(
          map['comentarios']?.map((x) => ComentarioModel.fromMap(x))),
    );
  }

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));
}
