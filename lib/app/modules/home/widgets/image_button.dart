import 'package:flutter/material.dart';
import 'package:teste_sciencedex/app/shared/theme/app_colors.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 129,
      decoration: BoxDecoration(
        color: AppColors.grey1,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 5,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  maxRadius: 22,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
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
