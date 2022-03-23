import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/controller/post_controller.dart';
import 'app/ui/home_page.dart';
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
      theme: MiioTema().theme,
      home: const HomePage(),
    );
  }
}
