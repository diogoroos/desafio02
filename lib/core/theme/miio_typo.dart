import 'package:flutter/material.dart';

import 'miio_colors.dart';

class MiioTypo extends TextTheme {
  final TextStyle button2 = const TextStyle(
    fontSize: 16.08,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontFamily: 'Roboto',
    color: MiioColors.secundario,
  );
  @override
  final TextStyle button = const TextStyle(
    fontSize: 16.08,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontFamily: 'Roboto',
    color: MiioColors.textoDestaque,
  );
  @override
  final TextStyle overline = const TextStyle(
    fontSize: 11.19,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    color: MiioColors.conteudoDestaque,
  );
  @override
  final TextStyle headline1 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto',
    color: MiioColors.textoDestaque,
  );
  @override
  final TextStyle subtitle1 = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto',
    color: MiioColors.textoDestaque,
  );
  @override
  final TextStyle subtitle2 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto',
    color: MiioColors.destaqueDetalhe,
  );
  @override
  final TextStyle bodyText1 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    color: MiioColors.textoClaro,
  );
  //Fonte para descriçao na página de detalhe
  @override
  final TextStyle bodyText2 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.30857,
    fontFamily: 'Roboto',
    color: MiioColors.conteudoDestaque,
  );
}
