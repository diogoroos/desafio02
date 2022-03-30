import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miio_test/app/shared/components/miio_dialog.dart';
import 'package:miio_test/app/ui/home/controller/post_controller.dart';
import '../../../../../core/theme/miio_assets.dart';
import '../../../../../core/theme/miio_colors.dart';
import '../../../../../core/theme/miio_typo.dart';
import 'package:provider/provider.dart';

class CompSliverAppBar extends StatelessWidget {
  const CompSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<PostController>(context);
    double areaFlexivel = MediaQuery.of(context).size.height * 0.3982;

    return SliverAppBar(
      pinned: true,
      floating: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: MiioColors.branco),
      expandedHeight: areaFlexivel,
      backgroundColor: MiioColors.branco,
      automaticallyImplyLeading: false,
      bottom: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: MiioColors.branco,
        centerTitle: true,
        title: Container(
          height: 4.91,
          width: 35.81,
          decoration: BoxDecoration(
            color: MiioColors.slider,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        background: Stack(children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  _controller.postSelecionado!.urlImagem,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              height: 377,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.7115],
                  colors: [
                    MiioColors.destaqueDetalhe.withAlpha(0),
                    MiioColors.destaqueDetalhe.withAlpha(100),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 103 - kToolbarHeight,
            left: 29,
            child: Container(
              decoration: BoxDecoration(
                color: MiioColors.fundoBotoesDetalhe,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 30.65,
              width: 29.9,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const ImageIcon(
                  AssetImage('${MiioAssets.icons}back.png'),
                  size: 16.79,
                  color: MiioColors.textoClaro,
                ),
              ),
            ),
          ),
          Positioned(
            top: 103 - kToolbarHeight,
            right: 28.19,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  color: MiioColors.fundoBotoesDetalhe,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 30.65,
                width: 29.9,
                child: IconButton(
                  onPressed: () {
                    miioDialog(context);
                  },
                  icon: const ImageIcon(
                    AssetImage('${MiioAssets.icons}heart.png'),
                    size: 16.79,
                    color: MiioColors.textoClaro,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 6.17),
                decoration: BoxDecoration(
                  color: MiioColors.fundoBotoesDetalhe,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 30.65,
                width: 29.9,
                child: IconButton(
                  onPressed: () {
                    miioDialog(context);
                  },
                  icon: const ImageIcon(
                    AssetImage('${MiioAssets.icons}share.png'),
                    size: 16.79,
                    color: MiioColors.textoClaro,
                  ),
                ),
              ),
            ]),
          ),
          Positioned(
            bottom: 70.09,
            left: 29,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: MiioColors.botaoFeatured,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 25.41,
              width: 82.19,
              child: Text(
                'FEATURED',
                style: MiioTypo().subtitle1.copyWith(
                      fontSize: 12,
                      color: MiioColors.branco,
                    ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
