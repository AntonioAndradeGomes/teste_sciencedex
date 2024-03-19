import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class ImageButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? imagePath;
  const ImageButton({
    super.key,
    this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.6,
      width: 129.62,
      decoration: BoxDecoration(
        color: AppColors.grey1,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(9),
        child: InkWell(
          borderRadius: BorderRadius.circular(9),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 5,
            ),
            child: Row(
              children: [
                Container(
                  height: 44.13,
                  width: 44.13,
                  decoration: const BoxDecoration(
                    color: AppColors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: imagePath == null || imagePath == ""
                      ? const Center(
                          child: Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            fit: BoxFit.cover,
                            File(
                              imagePath!,
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
                  width: 11.57,
                ),
                const Text(
                  'Editar Foto',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
