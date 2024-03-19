import 'package:flutter/material.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class NameTextFieldForDialogWidget extends StatelessWidget {
  final String? initialNameValue;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  const NameTextFieldForDialogWidget({
    super.key,
    this.initialNameValue,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: TextFormField(
        initialValue: initialNameValue,
        onChanged: onChanged,
        readOnly: readOnly,
        decoration: const InputDecoration(
          filled: true,
          fillColor: AppColors.grey2,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          hintText: 'Nomeie seu período',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.grey3,
            fontSize: 12,
          ),
        ),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
