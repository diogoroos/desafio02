import 'package:flutter/material.dart';
import 'package:miio_test/app/ui/home/controller/post_controller.dart';
import 'package:miio_test/app/ui/home/model/post_model.dart';
import '../../shared/card_profissional.dart';
import 'package:provider/provider.dart';

class CompPost extends StatelessWidget {
  const CompPost({Key? key, required this.postDaApi}) : super(key: key);
  final PostModel postDaApi;

  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<PostController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.12),
      child: InkWell(
        onTap: () {
          _controller.postSelecionado = postDaApi;
          Navigator.pushNamed(context, '/detalhe');
        },
        child: SizedBox(
          width: 400,
          height: 230,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width - 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    image: DecorationImage(
                      image: NetworkImage(
                        postDaApi.urlImagem,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * .20,
                  left: 15,
                  right: 15,
                  child: CardProfissional(
                    titulo: postDaApi.titulo,
                    subtitulo: postDaApi.descricao,
                    post: postDaApi,
                    compacto: false,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
