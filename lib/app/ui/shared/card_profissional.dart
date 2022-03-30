import 'package:flutter/material.dart';
import 'package:miio_test/app/ui/home/model/post_model.dart';
import '../../../core/theme/miio_colors.dart';
import '../../../core/theme/miio_typo.dart';

class CardProfissional extends StatelessWidget {
  const CardProfissional({
    Key? key,
    required this.titulo,
    required this.subtitulo,
    required this.post,
    required this.compacto,
  }) : super(key: key);

  final String titulo;
  final String subtitulo;
  final PostModel post;
  final bool compacto;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: MiioColors.destaqueDetalhe.withOpacity(.05),
            blurRadius: 20.0,
            spreadRadius: 10.0,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(14),
        color: MiioColors.branco,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .87,
        height: compacto ? 65 : 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 13.68),
            CircleAvatar(
              radius: 31,
              backgroundImage: NetworkImage(post.profissional.urlPerfil),
            ),
            const SizedBox(width: 14.46),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    titulo,
                    maxLines: compacto ? 1 : 2,
                    style: MiioTypo().subtitle1.copyWith(
                          color: MiioColors.textoDestaque,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
                compacto ? const SizedBox(height: 6.53) : Container(),
                SizedBox(
                  width: 200,
                  child: Text(
                    subtitulo,
                    maxLines: 1,
                    style: MiioTypo().bodyText1.copyWith(
                          color: MiioColors.textoClaro,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
