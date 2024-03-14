import 'package:flutter/material.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class InputUserNameWidget extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  const InputUserNameWidget({
    super.key,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        labelText: 'Apelido',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
