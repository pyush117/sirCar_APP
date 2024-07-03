import 'package:flutter/material.dart';
Widget ServicesTypes({
  BorderRadius? borderRadius,
  BoxShape boxshape = BoxShape.rectangle,
  String  assetImagePath="",
}) {
  return Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      //color: Colors.black,
      borderRadius: boxshape == BoxShape.rectangle ? borderRadius : null,
      shape: boxshape,
      image: DecorationImage(
        image: AssetImage(assetImagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}
