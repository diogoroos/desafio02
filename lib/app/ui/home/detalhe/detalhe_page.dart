import 'package:flutter/material.dart';
import 'package:miio_test/app/ui/home/controller/post_controller.dart';
import 'package:miio_test/app/ui/home/model/post_model.dart';
import 'components/comp_body.dart';
import 'components/comp_sliver_appbar.dart';
import '../../../../core/theme/consts.dart';
import '../../../../core/theme/miio_colors.dart';
import 'package:provider/provider.dart';

class DetalhePage extends StatefulWidget {
  const DetalhePage({Key? key}) : super(key: key);

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late PostController _controller;
  late PostModel _postSelecionado;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<PostController>(context);
    _postSelecionado = _controller.postSelecionado!;
    double areaFlexivel = MediaQuery.of(context).size.height * 0.3982;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CompSliverAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: Consts().tamanhoRestante(areaFlexivel - 300) +
                  (_postSelecionado.comentarios.length * 120),
              child: Stack(fit: StackFit.expand, children: [
                Container(
                  height: Consts().tamanhoRestante(areaFlexivel - 54),
                  color: MiioColors.branco,
                  child: const CompBody(),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
