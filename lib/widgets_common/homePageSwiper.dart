import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
Widget homePageSwiper(){
  return VxSwiper.builder(
      autoPlay: true,
      enlargeCenterPage: true,
      height: 150,
      aspectRatio: 16 / 9,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(

          //fit: BoxFit.fill,
        )
            .box
            .color(Colors.black)
            .roundedLg
            .clip(Clip.antiAlias)
            .margin(const EdgeInsets.symmetric(horizontal: 8.0))
            .make();
      });
}