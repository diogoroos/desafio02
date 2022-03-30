import 'package:flutter/material.dart';
import 'package:miio_test/app/ui/home/controller/post_controller.dart';
import '../../../../core/theme/miio_colors.dart';
import '../../../../core/theme/miio_tema.dart';
import 'package:provider/provider.dart';

class CompBotoes extends StatefulWidget {
  const CompBotoes({Key? key}) : super(key: key);

  @override
  State<CompBotoes> createState() => _CompBotoesState();
}

class _CompBotoesState extends State<CompBotoes> {
  late PostController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<PostController>(context);
    return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 23.12),
        children: [
          _botaoArt(),
          const SizedBox(width: 10),
          _botaoBuyNow(),
          const SizedBox(width: 10),
          _botaoAuction(),
          const SizedBox(width: 10),
          _botaoOverall(),
        ]);
  }

  Widget _botaoArt() {
    return SizedBox(
      width: 74.38,
      child: OutlinedButton(
        onPressed: () => _controller.acaoFiltroArte(),
        child: const Text('Art'),
        style: MiioTema().outlineButtonStyle.copyWith(
              backgroundColor: _controller.botaoSelecionadoArte
                  ? MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return MiioColors.botaoFiltroSelecionado;
                      },
                    )
                  : MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return MiioColors.botaoFiltroApagado;
                      },
                    ),
            ),
      ),
    );
  }

  Widget _botaoBuyNow() {
    return SizedBox(
      width: 100.58,
      child: OutlinedButton(
        onPressed: () => _controller.acaoFiltroBuyNow(),
        child: const Text('Buy Now'),
        style: MiioTema().outlineButtonStyle.copyWith(
              backgroundColor: _controller.botaoSelecionadoBuyNow
                  ? MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return MiioColors.botaoFiltroSelecionado;
                      },
                    )
                  : MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return MiioColors.botaoFiltroApagado;
                      },
                    ),
            ),
      ),
    );
  }

  Widget _botaoAuction() {
    return SizedBox(
      width: 94.63,
      child: OutlinedButton(
        onPressed: () => _controller.acaoFiltroAuction(),
        child: const Text('Auction'),
        style: MiioTema().outlineButtonStyle.copyWith(
              backgroundColor: _controller.botaoSelecionadoAuction
                  ? MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return MiioColors.botaoFiltroSelecionado;
                      },
                    )
                  : MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return MiioColors.botaoFiltroApagado;
                      },
                    ),
            ),
      ),
    );
  }

  Widget _botaoOverall() {
    return SizedBox(
      width: 94.63,
      child: OutlinedButton(
        onPressed: () => _controller.acaoFiltroOverall(),
        child: const Text('Overall'),
        style: MiioTema().outlineButtonStyle.copyWith(
              backgroundColor: _controller.botaoSelecionadoOverall
                  ? MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return MiioColors.botaoFiltroSelecionado;
                      },
                    )
                  : MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return MiioColors.botaoFiltroApagado;
                      },
                    ),
            ),
      ),
    );
  }
}
