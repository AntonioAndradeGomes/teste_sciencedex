import 'package:flutter/material.dart';

class Helpers {
  Helpers._();

  static Future<DateTime?> selectDate(
    BuildContext context,
    DateTime? initialDate,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2090),
    );

    return pickedDate;
  }
}
