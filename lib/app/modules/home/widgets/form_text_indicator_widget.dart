import 'package:flutter/material.dart';

class FormTextIndicatorWidget extends StatelessWidget {
  final String label;
  const FormTextIndicatorWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
