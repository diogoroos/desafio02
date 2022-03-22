import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'miio_colors.dart';
import 'miio_typo.dart';

class MiioTema {
  InputDecorationTheme get temaInput => InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: MiioColors.secundario,
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        labelStyle: const TextStyle(color: MiioColors.textoClaro),
        hintStyle: const TextStyle(color: MiioColors.textoDestaque),
      );

  ThemeData get theme => ThemeData(
        primaryColor: MiioColors.branco,
        focusColor: MiioColors.textoClaro,
        scaffoldBackgroundColor: MiioColors.branco,
        dividerColor: MiioColors.slider,
        textTheme: MiioTypo(),
        inputDecorationTheme: temaInput,
        buttonTheme: const ButtonThemeData(
          height: 43.3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        textSelectionTheme: const TextSelectionThemeData(
            selectionColor: MiioColors.estrelaSelecionada,
            selectionHandleColor: MiioColors.botaoFeatured),
      );
}
