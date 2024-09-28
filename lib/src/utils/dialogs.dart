import 'package:flutter/material.dart';
import 'package:template_flutter_app/src/utils/build_context_extension.dart';

showMessageDialog({
  required BuildContext context,
  required String title,
  required String content,
  required Function() onOkPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text(context.l10N.ok),
            onPressed: onOkPressed,
          ),
        ],
      );
    },
  );
}
