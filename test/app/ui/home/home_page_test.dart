import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:miio_test/app/shared/components/miio_textfield.dart';
import 'package:miio_test/app/ui/home/components/comp_botoes.dart';
import 'package:miio_test/app/ui/home/components/comp_bottom_buttons.dart';
import 'package:miio_test/app/ui/home/controller/post_controller.dart';
import 'package:miio_test/app/ui/home/enum/tipo_pintura_enum.dart';
import 'package:miio_test/app/ui/home/home_page.dart';
import 'package:miio_test/app/ui/home/model/comentario_model.dart';
import 'package:miio_test/app/ui/home/model/post_model.dart';
import 'package:miio_test/app/ui/home/model/profissional_model.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../controller/post_controller_test.mocks.dart';

void main() {
  final postCtrl = MockPostController();

  setUp(() {
    HttpOverrides.global = null;
    when(postCtrl.botaoSelecionadoArte).thenReturn(false);
    when(postCtrl.botaoSelecionadoAuction).thenReturn(false);
    when(postCtrl.botaoSelecionadoBuyNow).thenReturn(false);
    when(postCtrl.botaoSelecionadoOverall).thenReturn(false);
    var item1 = PostModel(
        profissional: ProfissionalModel(
            nomeProfissional: '',
            titulo: '',
            urlPerfil:
                'https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png'),
        titulo: '',
        descricao: '',
        urlImagem: 'https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png',
        pais: '',
        tipoVenda: '',
        tipo: TipoPinturaEnum.oa,
        altura: 7,
        largura: 12,
        comentarios: [ComentarioModel(texto: '', email: '', estrelas: 5)]);
    when(postCtrl.listaPosts).thenReturn([item1]);
    when(postCtrl.listaFiltrada).thenReturn([item1]);
  });

  Future<void> _iniciaHome(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<PostController>(
          create: (context) => postCtrl,
          child: const HomePage(),
        ),
      ),
    );
  }

  Future<void> _iniciaBotoesHome(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<PostController>(
          create: (context) => postCtrl,
          child: const CompBotoes(),
        ),
      ),
    );
  }

  group('HomePage testes', () {
    testWidgets('HomePage deve ter pesquisa e bootomNav',
        (WidgetTester tester) async {
      await _iniciaHome(tester);

      final textoSearch = find.byType(MiioTextfield);
      expect(textoSearch, findsOneWidget);

      final bottomNav = find.byType(CompBottomButtons);
      expect(bottomNav, findsOneWidget);
    });

    testWidgets('HomePage não deve ter mais de 4 botões de filtro',
        (WidgetTester tester) async {
      await _iniciaBotoesHome(tester);

      final botoesFiltro = find.byType(OutlinedButton);
      expect(botoesFiltro, findsNWidgets(4));
    });
  });
}
