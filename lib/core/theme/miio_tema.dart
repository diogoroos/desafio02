import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'miio_colors.dart';
import 'miio_typo.dart';

class MiioTema {
  ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    textStyle: MiioTypo().button,
    minimumSize: const Size(74.38, 43.3),
    alignment: Alignment.center,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ).copyWith(
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return MiioColors.botaoFiltroApagado;
        }
        return MiioColors.fundoPrincipal;
      },
    ),
    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const TextStyle(color: MiioColors.textoDestaque);
        }
        return const TextStyle(color: MiioColors.secundario);
      },
    ),
  );

  ThemeData get theme => ThemeData(
        primaryColor: MiioColors.branco,
        focusColor: MiioColors.textoClaro,
        scaffoldBackgroundColor: MiioColors.branco,
        dividerColor: MiioColors.slider,
        textTheme: MiioTypo(),
        outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
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
