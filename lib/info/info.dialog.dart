import 'package:flutter/material.dart';
import 'package:my_utils_app/common/utils/nav.dart';

void infoDialog(BuildContext context, String message, {List<Widget>? actions}) {
  List<Widget> defaultActions = [
    TextButton(
      onPressed: () {
        pop(context);
      },
      child: const Text("Ok"),
    )
  ];

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text(
            message,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          actions: actions ?? defaultActions,
        ),
      );
    },
  );
}
