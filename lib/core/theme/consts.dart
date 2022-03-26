import 'dart:ui';

import 'package:flutter/material.dart';

class Consts {
  static final pixelDevice = window.devicePixelRatio;
  static final tamanhoTela = window.physicalSize / pixelDevice;
  static final tamanhoLargura = tamanhoTela.width;
  static final tamanhoAltura =
      tamanhoTela.height - kToolbarHeight - kBottomNavigationBarHeight;

  double tamanhoRestante(double tamanhoUsado) {
    return tamanhoAltura - tamanhoUsado;
  }
}
