import 'package:flutter/material.dart';

import '../../core/base/controller_base.dart';
import '../model/post_model.dart';
import '../repository/post_repository.dart';

abstract class IPostController extends ControllerBase {
  List<PostModel>? listaPosts;
  List<PostModel>? listaFiltrada;
  bool isLoading = false;
  TextEditingController txtSearch = TextEditingController();
  late IPostRepository repository;
  void notifica();
  void acaoFiltroArte();
  void acaoFiltroBuyNow();
  void acaoFiltroAuction();
  void acaoFiltroOverall();
  bool botaoSelecionadoArte = false;
  bool botaoSelecionadoBuyNow = false;
  bool botaoSelecionadoAuction = false;
  bool botaoSelecionadoOverall = false;
  @override
  Future<void> buscaDados();
}

class PostController extends ChangeNotifier implements IPostController {
  @override
  List<PostModel>? listaPosts;

  @override
  List<PostModel>? listaFiltrada;

  @override
  IPostRepository repository = PostRepository();

  @override
  TextEditingController txtSearch = TextEditingController();

  @override
  bool botaoSelecionadoArte = false;
  @override
  bool botaoSelecionadoBuyNow = false;
  @override
  bool botaoSelecionadoAuction = false;
  @override
  bool botaoSelecionadoOverall = false;

  @override
  bool isLoading = false;

  @override
  void notifica() {
    notifyListeners();
  }

  @override
  Future<void> buscaDados() async {
    if (listaPosts == null) {
      isLoading = true;
      //notifyListeners();
      listaPosts = [];
      await repository.getData().then((value) {
        listaPosts =
            List.from(value.data).map((e) => PostModel.fromMap(e)).toList();
        listaFiltrada = listaPosts;
      });
      isLoading = false;
      //notifyListeners();
    }
  }

  @override
  void acaoFiltroArte() {
    botaoSelecionadoArte = true;
    botaoSelecionadoBuyNow = false;
    botaoSelecionadoAuction = false;
    botaoSelecionadoOverall = false;
    listaFiltrada =
        listaPosts!.where((element) => element.tipoVenda == "art").toList();
    notifyListeners();
  }

  @override
  void acaoFiltroBuyNow() {
    botaoSelecionadoArte = false;
    botaoSelecionadoBuyNow = true;
    botaoSelecionadoAuction = false;
    botaoSelecionadoOverall = false;
    listaFiltrada =
        listaPosts!.where((element) => element.tipoVenda == "buyNow").toList();
    notifyListeners();
  }

  @override
  void acaoFiltroAuction() {
    botaoSelecionadoArte = false;
    botaoSelecionadoBuyNow = false;
    botaoSelecionadoAuction = true;
    botaoSelecionadoOverall = false;
    listaFiltrada =
        listaPosts!.where((element) => element.tipoVenda == "auction").toList();
    notifyListeners();
  }

  @override
  void acaoFiltroOverall() {
    botaoSelecionadoArte = false;
    botaoSelecionadoBuyNow = false;
    botaoSelecionadoAuction = false;
    botaoSelecionadoOverall = true;
    listaFiltrada =
        listaPosts!.where((element) => element.tipoVenda == "overall").toList();
    notifyListeners();
  }

  @override
  void resetaDados() {
    listaPosts = [];
    notifyListeners();
  }
}
