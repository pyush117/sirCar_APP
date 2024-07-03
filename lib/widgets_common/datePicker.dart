import 'dart:js';

import 'package:flutter/material.dart';

Future<DateTime?> datePicker(context) {
  return  showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 06, 15),
      lastDate: DateTime(2024));
}
