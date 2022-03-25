import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miio_test/app/shared/components/appbar.dart';
import 'package:miio_test/app/ui/home/components/home_bottom_buttons.dart';
import 'package:miio_test/core/components/miio_textfield.dart';
import 'package:miio_test/core/theme/miio_tema.dart';
import 'package:miio_test/core/theme/miio_typo.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/miio_colors.dart';
import '../../controller/post_controller.dart';
import '../../model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PostController _controller;
  List<PostModel> listaFiltrada = [];
  @override
  void initState() {
    super.initState();
    Future.wait([_carregaDados()]).then((value) {
      _controller.notifica();
    });
  }

  Future<void> _carregaDados() async {
    await Provider.of<PostController>(context, listen: false).buscaDados();
  }

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<PostController>(context);

    listaFiltrada = _controller.listaPosts ?? [];

    var pixelDevice = window.devicePixelRatio;
    var tamanhoTela = window.physicalSize / pixelDevice;
    var tamanhoDisponivel =
        tamanhoTela.height - kToolbarHeight - kBottomNavigationBarHeight;

    return Scaffold(
        appBar: MiioAppBar(
          child: SizedBox(
            height: 40 + 43.3 + 27.73 + 24,
            width: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 40,
                child: Padding(
                    padding: const EdgeInsets.only(left: 23, right: 19),
                    child: MiioTextfield(
                      textController: _controller.txtSearch,
                    )),
              ),
              const SizedBox(height: 17.73),
              SizedBox(
                height: 43.3,
                child: ListView(
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
                    ]),
              ),
              const SizedBox(height: 30.59),
            ]),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: _controller.listaFiltrada != null
                  ? SizedBox(
                      height: tamanhoDisponivel - 130,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _controller.listaFiltrada!.length,
                          itemExtent: 230,
                          itemBuilder: (context, i) {
                            return _post(_controller.listaFiltrada![i]);
                          }),
                    )
                  : const LinearProgressIndicator()),
        ),
        bottomNavigationBar: const HomeBottomButtons());
  }

  // Widget search() {
  //   return TextField(
  //     decoration: InputDecoration(
  //       labelText: 'Search',
  //       floatingLabelStyle:
  //           const TextStyle(color: MiioColors.botaoFiltroSelecionado),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(14.0),
  //         borderSide: const BorderSide(
  //           color: MiioColors.botaoFiltroSelecionado,
  //           style: BorderStyle.solid,
  //           width: 1.5,
  //         ),
  //       ),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(14.0),
  //         borderSide: const BorderSide(
  //           color: MiioColors.secundario,
  //           style: BorderStyle.solid,
  //           width: 1.5,
  //         ),
  //       ),
  //       contentPadding: const EdgeInsets.fromLTRB(19.43, 11.94, 0, 2.06),
  //       labelStyle: MiioTypo().bodyText1,
  //     ),
  //     cursorHeight: 14,
  //     cursorWidth: 1,
  //     textAlignVertical: TextAlignVertical.center,
  //     controller: _controller.txtSearch,
  //     keyboardType: TextInputType.text,
  //     autocorrect: false,
  //     style: const TextStyle(
  //       fontSize: 14,
  //       height: 1.0,
  //       fontWeight: FontWeight.w500,
  //       fontStyle: FontStyle.normal,
  //       color: MiioColors.estrelaSelecionada,
  //     ),
  //   );
  // }

  Widget _post(PostModel post) {
    var x = MiioTypo().subtitle1.apply(color: Colors.black);
    var y = TextStyle(color: Colors.black, fontSize: 7.0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.12),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('detalhe');
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
                      post.urlImagem,
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
              child: Container(
                padding: EdgeInsets.only(top: 6),
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
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 13.68),
                      CircleAvatar(
                        radius: 21,
                        backgroundImage:
                            NetworkImage(post.profissional.urlPerfil),
                      ),
                      const SizedBox(width: 14.46),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 220,
                            height: 43,
                            child: Text(
                              post.titulo,
                              maxLines: 2,
                              style: MiioTypo().subtitle1.copyWith(
                                    color: MiioColors.textoDestaque,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            width: 250,
                            height: 25,
                            child: Text(
                              post.descricao,
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
              ),
            ),
          ],
        ),
      ),
    );

    // Container(
    //   height: MediaQuery.of(context).size.height * .30,
    //   width: 400,
    //   child: Stack(alignment: Alignment.center, children: [
    //     Positioned(
    //       top: 0,
    //       child: Container(
    //         height: MediaQuery.of(context).size.height * .25,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(20),
    //           image: DecorationImage(
    //             image: NetworkImage(
    //               post.urlImagem,
    //             ),
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       top: 10,
    //       left: 32,
    //       right: 0,
    //       child: Container(
    //         height: 87,
    //         child: Card(
    //           elevation: 5,
    //           margin: const EdgeInsets.fromLTRB(13.68, 18.17, 18.88, 17.0),
    //           shape: RoundedRectangleBorder(
    //             side: BorderSide(color: MiioColors.textoDestaque.withAlpha(5)),
    //             borderRadius: BorderRadius.circular(14),
    //           ),
    //           child: Row(children: [
    //             CircleAvatar(
    //               radius: 21,
    //               backgroundImage: NetworkImage(post.urlImagem),
    //             ),
    //             Container(
    //               height: 100,
    //               width: 300,
    //               child: Column(children: [
    //                 Container(
    //                   height: 30,
    //                   child: Text(
    //                     post.titulo,
    //                     style: MiioTypo().subtitle1,
    //                   ),
    //                 ),
    //                 Container(
    //                   width: 400,
    //                   height: 20,
    //                   child: Text(
    //                     post.descricao,
    //                     style: MiioTypo().bodyText1,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                 ),
    //               ]),
    //             ),
    //           ]),
    //         ),
    //       ),
    //     ),
    //   ]),
    // );
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
