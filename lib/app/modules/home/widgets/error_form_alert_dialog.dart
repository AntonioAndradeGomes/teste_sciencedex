import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ErrorFormAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  const ErrorFormAlertDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(
        title,
      ),
      content: Column(
        children: [Text(message)],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: const Text(
            "Ok",
          ),
        ),
      ],
    );
  }
}
