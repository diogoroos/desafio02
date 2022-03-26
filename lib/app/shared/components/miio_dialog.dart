import 'package:flutter/material.dart';

Future<void> miioDialog(BuildContext context) async {
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
