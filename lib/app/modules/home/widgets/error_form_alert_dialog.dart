import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ErrorFormAlertDialog extends StatelessWidget {
  final bool isName;
  final bool isInit;
  final bool isEnd;
  final bool isCategory;
  const ErrorFormAlertDialog({
    super.key,
    required this.isName,
    required this.isInit,
    required this.isEnd,
    required this.isCategory,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text(
        "Alguns itens devem ser preenchidos corretamente!",
      ),
      content: Column(
        children: [
          const Text("Devem ser preenchidos: "),
          isName ? const Text("Nome") : const SizedBox(),
          isInit ? const Text("Data de Começo") : const SizedBox(),
          isEnd ? const Text("Data de Fim") : const SizedBox(),
          isCategory ? const Text("Categoria") : const SizedBox(),
        ],
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
