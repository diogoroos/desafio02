import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miio_test/core/theme/miio_colors.dart';

class MiioAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;

  const MiioAppBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _safeArea = kToolbarHeight;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: MiioColors.branco,
        child: Column(
          key: const Key('DefaultAppBar'),
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SizedBox(height: _safeArea), child],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    var height = kToolbarHeight + 40 + 27.73 + 43.3;

    return Size.fromHeight(height);
  }
}
