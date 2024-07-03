import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sircar/SignUp_Screen/signup_screen.dart';
import 'package:sircar/consts/images.dart';
import 'package:sircar/consts/styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../SignUp_Screen/login_screen.dart';
import '../../consts/Strings.dart';
import '../../consts/colors.dart';
import '../../consts/firebase_consts.dart';
import '../../widgets_common/appLogoWidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating a method to change screen
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      //Get.to(()=>LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => SignUpScreen());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Image.asset(splashBg,width: 300,),
            // ),
            Center(child: SizedBox(height: 300,)),
            // applogoWidget(),
            Image.asset(splashBg2,width: 400,),
            // AppName.text.fontFamily(bold).size(22).color(yellow).make(),
            50.heightBox,

            //AppVersion.text.color(yellow).make(),
            Spacer(),
            credits.text.color(yellow).fontFamily(semibold).make(),
            30.heightBox,
            // our splash screen UI is completed...
          ],
        ),
      ),
    );

  }


  }



