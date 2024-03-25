import 'package:flutter/material.dart';

alert(BuildContext context, String msg, {String? title, Function? callback}) {
  showDialog(
      barrierDismissible: false,
      // only click on alert dialog options to close
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // does not allow close on back button
          child: AlertDialog(
            title: Text(title ?? 'Aviso'),
            content: Text(msg),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (callback != null) {
                    callback();
                  }
                },
                child: const Text('Ok'),
              )
            ],
          ),
        );
      });
}