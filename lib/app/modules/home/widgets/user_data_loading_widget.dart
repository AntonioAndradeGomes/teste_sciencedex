import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class UserDataLoadingWidget extends StatelessWidget {
  const UserDataLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey3,
      highlightColor: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.grey3,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 55,
            width: 129,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.grey3,
            ),
          ),
        ],
      ),
    );
  }
}
