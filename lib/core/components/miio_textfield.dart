import 'package:flutter/material.dart';
import 'package:miio_test/core/theme/miio_colors.dart';
import 'package:miio_test/core/theme/miio_typo.dart';

class MiioTextfield extends StatelessWidget {
  const MiioTextfield({Key? key, this.textController}) : super(key: key);
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return TextField(
      decoration: InputDecoration(
        labelText: 'Search',
        floatingLabelStyle:
            const TextStyle(color: MiioColors.botaoFiltroSelecionado),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: MiioColors.botaoFiltroSelecionado,
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: MiioColors.secundario,
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(19.43, 11.94, 0, 2.06),
        labelStyle: MiioTypo().bodyText1,
      ),
      controller: _controller,
      cursorHeight: 14,
      cursorWidth: 1,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.text,
      autocorrect: false,
      style: const TextStyle(
        fontSize: 14,
        height: 1.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: MiioColors.estrelaSelecionada,
      ),
    );
  }
}
