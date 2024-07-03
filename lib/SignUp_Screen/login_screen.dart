import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sircar/SignUp_Screen/signup_screen.dart';
import 'package:sircar/consts/Strings.dart';
import 'package:sircar/consts/colors.dart';
import 'package:sircar/controllers/auth_contoller.dart';
import 'package:sircar/views/Home_screen/home_screen.dart';
import 'package:sircar/widgets_common/custom_textfield.dart';
import 'package:sircar/widgets_common/ourButton.dart';
import 'package:velocity_x/velocity_x.dart';
import '../consts/styles.dart';
import '../widgets_common/appLogoWidget.dart';
import '../widgets_common/exit_dialog.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (contex) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              100.heightBox,
              (context.screenHeight * 0.1).heightBox,
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Log in to".text.white.size(22.0).fontFamily(bold).make(),
                  applogoWidget(),

                ],
              ),
              // 8.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(

                        title: email,
                        hint: emailHint,
                        isPass: false,
                        controller: controller.emailController),
                    customTextField(

                        title: password,
                        hint: passwordHint,
                        isPass: true,
                        controller: controller.passwordController),
                    // Align(
                    //     alignment: Alignment.centerRight,
                    //     child: TextButton(
                    //         onPressed: () {}, child: forgetPassword.text.make())),
                    40.heightBox,
                    controller.isLoading.value?const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(yellow),
                    ):ourBuutton(
                        color: black,
                        title: login,
                        textColor: white,
                        onPress: () async {
                          controller.isLoading(true);
                          await controller
                              .loginMethod(context: context)
                              .then((value) {
                            if (value != null) {
                              VxToast.show(context,
                                  msg: "Logged in Successfully");
                              Get.offAll(() => HomeScreen());
                            } else{

                              controller.isLoading(false);
                            }
                          });
                        }).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    createNewAccount.text.color(white).fontFamily(bold).make(),
                    5.heightBox,
                    ourBuutton(
                        color: black,
                        title: signup,
                        textColor: white,
                        onPress: () {
                          Get.to(() => SignUpScreen());
                        }).box.width(context.screenWidth - 50).make(),
                    50.heightBox,
                  ],
                )
                    .box
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .color(yellow)
                    .make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
