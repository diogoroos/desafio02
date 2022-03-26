import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:miio_test/app/ui/home/controller/post_controller.dart';
import 'package:miio_test/app/ui/home/model/comentario_model.dart';
import '../../../../../core/theme/consts.dart';
import '../../../../../core/theme/miio_assets.dart';
import '../../../../../core/theme/miio_colors.dart';
import '../../../../../core/theme/miio_typo.dart';
import 'package:provider/provider.dart';

class CompComentarios extends StatelessWidget {
  const CompComentarios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<PostController>(context);
    var _comentarios = _controller.postSelecionado!.comentarios;
    return Column(children: [
      const Divider(),
      const SizedBox(height: 24.43),
      Text('Comments', style: MiioTypo().subtitle1.copyWith(fontSize: 18)),
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _comentarios.length,
          itemExtent: 126.19,
          itemBuilder: (context, i) {
            return Padding(
                child: cardComentario(_comentarios[i]),
                padding: const EdgeInsets.only(bottom: 10.79));
          }),
    ]);
  }

  Widget cardComentario(ComentarioModel comentario) {
    return Container(
      decoration: BoxDecoration(
        color: MiioColors.cardComentario,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 126.19,
        padding: const EdgeInsets.only(left: 18.15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RatingBar(
                  initialRating: comentario.estrelas.toDouble(),
                  minRating: 0,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemSize: 22,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                      full: const ImageIcon(
                          AssetImage('${MiioAssets.icons}heart_full.png'),
                          color: MiioColors.estrelaSelecionada,
                          size: 20.32),
                      empty: const ImageIcon(
                          AssetImage('${MiioAssets.icons}heart_empty.png'),
                          color: MiioColors.estrelaSelecionada,
                          size: 20.32),
                      half: Container()),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    comentario.texto,
                    style: MiioTypo().subtitle2.copyWith(fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: Consts.tamanhoLargura * 0.8,
                  child: Wrap(children: [
                    Text(
                      'Reviewed by ',
                      style: MiioTypo().bodyText1.copyWith(
                            color: MiioColors.textoClaro,
                          ),
                    ),
                    Text(
                      comentario.email,
                      style: MiioTypo().bodyText1.copyWith(
                            color: MiioColors.textoDestaque,
                          ),
                    ),
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
