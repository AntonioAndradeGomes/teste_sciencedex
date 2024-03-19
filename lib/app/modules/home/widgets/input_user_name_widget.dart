import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Apelido',
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 31,
          child: TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey3,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey3,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.grey3,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
