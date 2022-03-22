import 'package:flutter/material.dart';

import 'miio_colors.dart';

class MiioTypo extends TextTheme {
  final TextStyle button2 = const TextStyle(
    fontSize: 16.08,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    height: 18.84,
    fontFamily: 'Roboto',
    color: MiioColors.secundario,
  );
  @override
  final TextStyle button = const TextStyle(
    fontSize: 16.08,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    height: 18.84,
    fontFamily: 'Roboto',
    color: MiioColors.textoDestaque,
  );
  @override
  final TextStyle overline = const TextStyle(
    fontSize: 11.19,
    fontWeight: FontWeight.w500,
    height: 20.51,
    fontFamily: 'Roboto',
    color: MiioColors.conteudoDestaque,
  );
  @override
  final TextStyle headline1 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 28.13,
    fontFamily: 'Roboto',
    color: MiioColors.textoDestaque,
  );
  @override
  final TextStyle subtitle1 = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto',
    color: MiioColors.textoDestaque,
    height: 19.92,
  );
  @override
  final TextStyle subtitle2 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto',
    color: MiioColors.destaqueDetalhe,
    height: 18.75,
  );
  @override
  final TextStyle bodyText1 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 16.41,
    fontFamily: 'Roboto',
    color: MiioColors.textoClaro,
  );
  @override
  final TextStyle bodyText2 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 25.65,
    fontFamily: 'Roboto',
    color: MiioColors.conteudoDestaque,
  );
}
