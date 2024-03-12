import 'package:flutter/material.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class DividerWidget extends StatelessWidget {
  final double top;
  final double bottom;
  const DividerWidget({
    super.key,
    this.top = 20,
    this.bottom = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
      ),
      child: const Divider(
        color: AppColors.grey3,
        height: 1.9,
      ),
    );
  }
}
