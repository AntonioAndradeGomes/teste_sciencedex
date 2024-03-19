import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class TextFieldForDialogWidget extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  const TextFieldForDialogWidget({
    super.key,
    this.initialValue,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.2,
      height: 24.72,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        readOnly: readOnly,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
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
          contentPadding: EdgeInsets.zero,
          hintText: 'un',
          hintStyle: TextStyle(
            color: AppColors.grey3,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
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
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
