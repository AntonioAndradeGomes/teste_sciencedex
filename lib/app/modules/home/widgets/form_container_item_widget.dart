import 'package:flutter/material.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class FormContainerItemWidget extends StatelessWidget {
  final Widget? child;
  const FormContainerItemWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey3,
        ), // Cor da borda
        color: Colors.white,
        borderRadius: BorderRadius.circular(7), // Raio da borda
      ),
      child: child,
    );
  }
}
