
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        icon,
        width: 26,
      ),
      10.heightBox,
      title!.text.color(Colors.yellow).make()
    ],
  ).box.rounded.black.size(width, height).make();
}