import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sircar/widgets_common/custom_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            (context.screenHeight*0.1).heightBox,
            "join the sircar".text.white.size(20).make(),

                 Column(
                children: [
                  // customTextField(title: "Name", hint: "piyush", isPass: false),
                  // customTextField(title: "Name", hint: "piyush", isPass: false),
                  // customTextField(title: "Name", hint: "piyush", isPass: false),
                  customTextField(title: "Name", hint: "piyush", isPass: false),
                ],
              ),
          ],
        ),
      ),


    );
  }
}
