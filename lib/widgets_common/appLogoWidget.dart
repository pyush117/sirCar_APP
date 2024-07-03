import 'package:flutter/material.dart';
import 'package:sircar/consts/images.dart';
import 'package:velocity_x/velocity_x.dart';
Widget applogoWidget() {
  // using velocity X here
  return Image.asset(AppLogo)
      .box
      .black
      .size(90, 90)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}