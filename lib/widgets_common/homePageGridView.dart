import 'package:flutter/material.dart';

Widget homePageGridView() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Wrap(
      spacing: 15.0, // Horizontal spacing between children
      runSpacing: 5.0, // Vertical spacing between rows
      children: List.generate(6, (index) {
        return Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15.0),
          ),
        );
      }),
    ),
  );
}
