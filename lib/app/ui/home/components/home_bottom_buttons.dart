import 'package:flutter/material.dart';
import 'package:miio_test/core/theme/miio_assets.dart';
import 'package:miio_test/core/theme/miio_colors.dart';

class HomeBottomButtons extends StatelessWidget {
  const HomeBottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: BottomNavigationBar(
        unselectedItemColor: MiioColors.estrelaSelecionada,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('${MiioAssets.icons}explorer.png'),
                color: MiioColors.estrelaSelecionada, size: 20.32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('${MiioAssets.icons}heart.png'),
                color: MiioColors.estrelaSelecionada, size: 20.32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('${MiioAssets.icons}lock.png'),
                color: MiioColors.estrelaSelecionada, size: 20.32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('${MiioAssets.icons}person.png'),
                color: MiioColors.estrelaSelecionada, size: 20.32),
            label: '',
          ),
        ],
        onTap: (i) {
          _mostraErro(context);
        },
      ),
    );
  }

  Future<void> _mostraErro(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: const Text('Isso é tudo por aqui ;)'),
          actions: <Widget>[
            TextButton(
              child: const Text('Beleza!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
