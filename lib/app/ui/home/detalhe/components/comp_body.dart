import 'package:flutter/material.dart';
import 'package:miio_test/app/ui/home/controller/post_controller.dart';
import 'package:miio_test/app/ui/home/enum/tipo_pintura_enum.dart';
import 'comp_comentarios.dart';
import '../../../shared/card_profissional.dart';
import '../../../../../core/theme/miio_assets.dart';
import '../../../../../core/theme/miio_colors.dart';
import '../../../../../core/theme/miio_typo.dart';
import 'package:provider/provider.dart';

class CompBody extends StatefulWidget {
  const CompBody({Key? key}) : super(key: key);

  @override
  State<CompBody> createState() => _CompBodyState();
}

class _CompBodyState extends State<CompBody> {
  late PostController _controller;
  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<PostController>(context);
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30.5),
      color: MiioColors.branco,
      child: Column(children: [
        Text(
          _controller.postSelecionado!.titulo,
          style: MiioTypo().headline1,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 1.58, top: 30.92, bottom: 27.08),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            dimensao(),
            tipoPintura(),
            paisOrigem(),
          ]),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 0.5),
            child: Text(
              _controller.postSelecionado!.descricao,
              style: MiioTypo().bodyText2,
            )),
        Container(
          padding: const EdgeInsets.only(top: 25.18, bottom: 39.02),
          child: cardProfissional(),
        ),
        const CompComentarios()
      ]),
    );
  }

  Widget dimensao() {
    return Row(children: [
      const ImageIcon(
        AssetImage('${MiioAssets.icons}dimension.png'),
        size: 16.79,
        color: MiioColors.textoClaro,
      ),
      const SizedBox(width: 8.94),
      Text(
        _controller.postSelecionado!.largura.toString() +
            ' X ' +
            _controller.postSelecionado!.altura.toString(),
        style: MiioTypo().overline,
      ),
    ]);
  }

  Widget tipoPintura() {
    return Row(children: [
      const ImageIcon(
        AssetImage('${MiioAssets.icons}paint.png'),
        size: 16.79,
        color: MiioColors.textoClaro,
      ),
      const SizedBox(width: 8.94),
      Text(
        _controller.postSelecionado!.tipo.description,
        style: MiioTypo().overline,
      ),
    ]);
  }

  Widget paisOrigem() {
    return Row(children: [
      const ImageIcon(
        AssetImage('${MiioAssets.icons}world.png'),
        size: 16.79,
        color: MiioColors.textoClaro,
      ),
      const SizedBox(width: 8.94),
      Text(
        _controller.postSelecionado!.pais,
        style: MiioTypo().overline,
      ),
    ]);
  }

  Widget cardProfissional() {
    return SizedBox(
      height: 79.1,
      child: CardProfissional(
        titulo: _controller.postSelecionado!.profissional.nomeProfissional,
        subtitulo: _controller.postSelecionado!.profissional.titulo,
        post: _controller.postSelecionado!,
        compacto: true,
      ),
    );
  }
}
