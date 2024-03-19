import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class LogoutWidget extends StatelessWidget {
  final String? pathImage;
  final String? username;
  const LogoutWidget({
    super.key,
    this.pathImage,
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 51.62,
          width: 51.62,
          decoration: const BoxDecoration(
            color: AppColors.blue,
            shape: BoxShape.circle,
          ),
          child: pathImage == null || pathImage == ""
              ? const Center(
                  child: Icon(
                    Icons.image_rounded,
                    color: Colors.white,
                    size: 15,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    fit: BoxFit.cover,
                    File(
                      pathImage!,
                    ),
                    errorBuilder: (_, __, ___) {
                      return const Icon(
                        Icons.add_a_photo_rounded,
                        color: Colors.white,
                        size: 15,
                      );
                    },
                  ),
                ),
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blue,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: const Text(
                  'Sair',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
