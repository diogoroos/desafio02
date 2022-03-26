import 'package:flutter/material.dart';
import 'package:miio_test/app/shared/components/miio_dialog.dart';
import '../../../../core/theme/miio_assets.dart';
import '../../../../core/theme/miio_colors.dart';

class CompBottomButtons extends StatelessWidget {
  const CompBottomButtons({Key? key}) : super(key: key);

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
          miioDialog(context);
        },
      ),
    );
  }
}
