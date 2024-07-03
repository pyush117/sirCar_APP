import 'package:flutter/material.dart';
import 'package:sircar/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/colors.dart';


Widget customTextField(
    {required String title,
    required String hint,
    required bool isPass,
      String? Function(String?)? validator,
      onPress,
    TextEditingController? controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title.text.color(Colors.white).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        onTap: onPress,
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:  TextStyle(

            color: Colors.black.withOpacity(0.3),
          ),
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: yellow),
          ),
        ),validator: validator,
      ),
      5.heightBox,
    ],
  );
}
