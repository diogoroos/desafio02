import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/consts.dart';
import '../../shared/components/appbar.dart';
import '../../shared/components/miio_textfield.dart';
import 'components/comp_botoes.dart';
import 'components/comp_bottom_buttons.dart';
import 'components/comp_post.dart';
import 'controller/post_controller.dart';
import 'model/post_model.dart';

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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: MiioAppBar(
          child: SizedBox(
            width: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 40,
                child: Padding(
                    padding: const EdgeInsets.only(left: 23, right: 19),
                    child: MiioTextfield(
                      acao: (valor) {
                        _controller.acaoFiltroTexto(valor);
                      },
                    )),
              ),
              const SizedBox(height: 17.73),
              const SizedBox(height: 43.3, child: CompBotoes()),
            ]),
          ),
        ),
        body: SingleChildScrollView(
          child: _controller.listaFiltrada != null
              ? SizedBox(
                  height: Consts().tamanhoRestante(120),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.listaFiltrada!.length,
                      itemExtent: 235,
                      itemBuilder: (context, i) {
                        return CompPost(
                            postDaApi: _controller.listaFiltrada![i]);
                      }),
                )
              : const LinearProgressIndicator(),
        ),
        bottomNavigationBar: const CompBottomButtons(),
      ),
    );
  }
}
