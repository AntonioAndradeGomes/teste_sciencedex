import 'package:flutter/material.dart';

class DropDownCategoryWidget extends StatelessWidget {
  final String? value;
  final List<String> categories;
  final ValueChanged<String?>? onChanged;

  const DropDownCategoryWidget({
    super.key,
    this.value,
    required this.categories,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      borderRadius: BorderRadius.circular(8),
      iconSize: 15,
      isDense: false,
      padding: EdgeInsets.zero,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
      ),
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      value: value,
      items: categories
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
