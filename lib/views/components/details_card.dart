import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
Widget detailsCard({
  width, String?count,  String?title
}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.color(yellow).size(16).make(),
      5.heightBox,
      title!.text.color(Colors.black).make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .height(80)
      .padding(const EdgeInsets.all(4.0))
      .make();
}