import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sircar/consts/images.dart';
import 'package:sircar/consts/styles.dart';
import 'package:sircar/controllers/auth_contoller.dart';
import 'package:sircar/views/Home_screen/home_screen.dart';
import 'package:sircar/widgets_common/appLogoWidget.dart';
import 'package:velocity_x/velocity_x.dart';
import '../consts/Strings.dart';
import '../consts/colors.dart';
import '../consts/firebase_consts.dart';
import '../widgets_common/custom_textfield.dart';
import '../widgets_common/ourButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  // Email validation function
  bool isValidEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              // Image.asset(AppLogo,width: 100,),
              50.heightBox,
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Join the".text.fontFamily(bold).size(22).color(white).make(),
                  applogoWidget(),

                ],
              ),
              // 10.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        title: name,
                        hint: nameHint,
                        isPass: false,
                        controller: nameController),
                    customTextField(
                        title: email,
                        hint: emailHint,
                        isPass: false,
                        controller: emailController),
                    customTextField(
                        title: password,
                        hint: passwordHint,
                        isPass: true,
                        controller: passwordController),
                    customTextField(
                        title: retypePassword,
                        hint: passwordHint,
                        isPass: true,
                        controller: passwordRetypeController),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: forgetPassword.text.make())),
                    5.heightBox,
                    Row(
                      children: [
                        Checkbox(
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue!;
                            });
                          },
                          checkColor: yellow,
                        ),
                        10.widthBox,
                        Expanded(
                          child: RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(color: black)),
                            TextSpan(
                                text: termAndCond,
                                style: TextStyle(color: white)),
                            TextSpan(
                                text: " & ", style: TextStyle(color: white)),
                            TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(color: white)),
                          ])),
                        )
                      ],
                    ),
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(yellow),
                          )
                        : ourBuutton(
                            color: isCheck == true ? black : lightGrey,
                            title: signup,
                            textColor: white,
                            onPress: () async {
                              if (isCheck != false) {
                                if (!isValidEmail(emailController.text)) {
                                  VxToast.show(context,
                                      msg: "Please enter a valid email");
                                  return;
                                }
                                controller.isLoading(true);
                                try {
                                  await controller
                                      .signUpMethod(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    return controller.storeUserData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                    );
                                  }).then((value) {
                                    VxToast.show(context,
                                        msg: "Logged in Successfully");
                                    Get.offAll(() => HomeScreen());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isLoading(false);
                                }
                              }
                            }).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        alreadyHaveAccount.text.color(black).make(),
                        login.text.color(white).fontFamily(bold).make().onTap(() {
                          Get.back();
                        })
                      ],
                    ),
                  ],
                )
                    .box
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .color(yellow)
                    .make(),
              ),
              180.squareBox,
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Text('Skip'),
                    style: ElevatedButton.styleFrom(
                      primary: yellow, // Background color
                      onPrimary: Colors.white, // Text color
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Border radius
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

