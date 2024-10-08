import 'package:flutter/material.dart';
import 'package:miio_test/app/ui/home/controller/post_controller.dart';
import 'app/ui/home/detalhe/detalhe_page.dart';
import 'package:provider/provider.dart';

import 'app/ui/home/home_page.dart';
import 'core/theme/miio_tema.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostController()),
        //Provider(create: (context) => PostController()),
      ],
      child: const MiioApp(),
    ),
  );
}

class MiioApp extends StatelessWidget {
  const MiioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miio Teste',
      debugShowCheckedModeBanner: false,
      theme: MiioTema().theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detalhe': (context) => const DetalhePage(),
      },
    );
  }
}
