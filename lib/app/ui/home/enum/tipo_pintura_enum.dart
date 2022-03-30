import 'package:flutter/foundation.dart';

enum TipoPinturaEnum { oa, gu, na }

TipoPinturaEnum localizaTipo(Object? valor) {
  TipoPinturaEnum? nome;
  TipoPinturaEnum.values.asMap().forEach((key, value) {
    if (value.toString().split('.')[1] == valor) {
      nome = value;
    }
  });
  return nome!;
}

extension TipoPintura on TipoPinturaEnum {
  String get nomeInterno => describeEnum(this);

  String get description {
    switch (this) {
      case TipoPinturaEnum.oa:
        return 'Oil and Acrilic';
      case TipoPinturaEnum.gu:
        return 'Gouache';
      case TipoPinturaEnum.na:
        return 'Indian Ink';
      default:
        return '';
    }
  }
}
