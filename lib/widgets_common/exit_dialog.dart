import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sircar/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';

import 'ourButton.dart';

Widget exitDialog(context){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize:MainAxisSize.min ,
      children: [
        "Confirm".text.size(18).color(black).make(),
        Divider(),
        10.heightBox,
        "Are you sure you want to exit?".text.size(16).color(black).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourBuutton(color: yellow,onPress: (){
              SystemNavigator.pop();
            },textColor: white,title: "yes"),
            ourBuutton(color: yellow,onPress: (){
              Navigator.pop(context);
            },textColor: white,title: "No"),
          ],
        )
      ],
    ).box.color(lightGrey).padding(EdgeInsets.all(12)).roundedSM.make(),
  );
}