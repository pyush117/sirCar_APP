
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sircar/consts/images.dart';
import 'package:sircar/widgets_common/ourButton.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:io';
import '../../consts/Strings.dart';
import '../../consts/colors.dart';
import '../../controllers/profile_controlller.dart';
import '../../widgets_common/custom_textfield.dart';


// class EditProfileScreen extends StatelessWidget {
//   const EditProfileScreen({super.key, this.data});
//   final dynamic data;
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProfileController>();
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Obx(
//         () => SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               //if data image url and controller path is empty
//               data['imageUrl'] == '' && controller.profileImagePath.isEmpty
//                   ? Image.asset(
//                       defaultProfile,
//                       width: 100,
//                       fit: BoxFit.cover,
//                     ).box.roundedFull.clip(Clip.antiAlias).make()
//                   //if data is not empty but controller path is empty
//                   : data['imageUrl'] != '' &&
//                           controller.profileImagePath.isEmpty
//                       ? Image.network(
//                           data['imageUrl'],
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ).box.roundedFull.clip(Clip.antiAlias).make()
//                       // if both are empty
//                       : Image.file(
//                           File(controller.profileImagePath.value),
//                           width: 100,
//                           fit: BoxFit.cover,
//                         ).box.roundedFull.clip(Clip.antiAlias).make(),
//               10.heightBox,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ourBuutton(
//                       color: yellow,
//                       onPress: () {
//                         controller.changeImage(context);
//                       },
//                       textColor: white,
//                       title: "change"),
//                   15.widthBox,
//                   ourBuutton(
//                       color: yellow,
//                       onPress: () async  {
//
//                         if (controller.profileImagePath.value.isNotEmpty) {
//                           await controller.uploadProfileImage();
//
//                         } else {
//                           controller.profileImageLink = data['imageUrl'];
//                         }
//
//                         controller.updateProfilePicture(controller.profileImageLink);
//                         controller.isLoading(false);
//                         VxToast.show(context, msg: "updated");
//
//
//                       },
//                       textColor: white,
//                       title: "Save"),
//
//                 ],
//               ),
//
//               const Divider(),
//               20.heightBox,
//               customTextField(
//                   controller: controller.nameController,
//                   title: name,
//                   hint: nameHint,
//                   isPass: false),
//               10.heightBox,
//               customTextField(
//                   controller: controller.oldpassController,
//                   title: oldpass,
//                   hint: passwordHint,
//                   isPass: true),
//               10.heightBox,
//               customTextField(
//                   controller: controller.newpassController,
//                   title: password,
//                   hint: newpass,
//                   isPass: true),
//               20.heightBox,
//               controller.isLoading.value
//                   ? const CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation(yellow),
//                     )
//                   : SizedBox(
//                       width: context.screenWidth - 60,
//                       child: ourBuutton(
//                           color: yellow,
//                           onPress: () async {
//                             controller.isLoading(true);
//                             //if image is not selected
//                             // if (controller.profileImagePath.value.isNotEmpty) {
//                             //   await controller.uploadProfileImage();
//                             //
//                             // } else {
//                             //   controller.profileImageLink = data['imageUrl'];
//                             // }
//
//                             //if old password matches database
//                             if (data['password'] ==
//                                 controller.oldpassController.text) {
//                               await controller.changeAuthPassword(
//                                   data['email'],
//                                   controller.oldpassController.text,
//                                   controller.newpassController.text);
//
//                               await controller.updatePassword(
//                                 name: controller.nameController.text,
//                                 password: controller.newpassController.text,
//                               );
//                               VxToast.show(context, msg: "updated");
//                             } else {
//                               VxToast.show(context,
//                                   msg: "Password Does Not Match");
//                               controller.isLoading(false);
//                             }
//                           },
//                           textColor: white,
//                           title: "save")),
//             ],
//           )
//               .box
//               .white
//               .shadowSm
//               .rounded
//               .padding(const EdgeInsets.all(16))
//               .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
//               .make(),
//         ),
//       ),
//     );
//   }
// }
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(),
      body: Obx(
            () => SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle profile image display based on the current state
              if ((data['imageUrl'] == null || data['imageUrl'] == '') && controller.profileImagePath.isEmpty)
                Image.asset(
                  defaultProfile,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make()
              else if (data['imageUrl'] != null && data['imageUrl'] != '' && controller.profileImagePath.isEmpty)
                Image.network(
                  data['imageUrl'],
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make()
              else
                Image.file(
                  File(controller.profileImagePath.value),
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ourBuutton(
                    color: yellow,
                    onPress: () {
                      controller.changeImage(context);
                    },
                    textColor: white,
                    title: "Change",
                  ),
                  15.widthBox,
                  ourBuutton(
                    color: yellow,
                    onPress: () async {
                      if (controller.profileImagePath.value.isNotEmpty) {
                        await controller.uploadProfileImage();
                      } else {
                        controller.profileImageLink = data['imageUrl'] ?? '';
                      }

                      await controller.updateProfilePicture(controller.profileImageLink);
                      VxToast.show(context, msg: "Profile picture updated");
                    },
                    textColor: white,
                    title: "Save",
                  ),
                ],
              ),
              const Divider(),
              20.heightBox,
              customTextField(
                controller: controller.nameController,
                title: name,
                hint: nameHint,
                isPass: false,
              ),
              10.heightBox,
              customTextField(
                controller: controller.oldpassController,
                title: oldpass,
                hint: passwordHint,
                isPass: true,
              ),
              10.heightBox,
              customTextField(
                controller: controller.newpassController,
                title: password,
                hint: newpass,
                isPass: true,
              ),
              20.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(yellow),
              )
                  : SizedBox(
                width: context.screenWidth - 60,
                child: ourBuutton(
                  color: yellow,
                  onPress: () async {
                    controller.isLoading(true);

                    // Ensure data['password'] is not null
                    if (data['password'] != null && data['password'] == controller.oldpassController.text) {
                      // Ensure data['email'] is not null
                      if (data['email'] != null) {
                        await controller.changeAuthPassword(
                          data['email'],
                          controller.oldpassController.text,
                          controller.newpassController.text,
                        );

                        await controller.updatePassword(
                          password: controller.newpassController.text,
                          name: controller.nameController.text,
                        );

                        VxToast.show(context, msg: "Password and name updated");
                      } else {
                        VxToast.show(context, msg: "Email is missing");
                      }
                    } else {
                      VxToast.show(context, msg: "Password does not match");
                    }
                    controller.isLoading(false);
                  },
                  textColor: white,
                  title: "Save",
                ),
              ),
            ],
          ).box.white.shadowSm.rounded.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 50, left: 12, right: 12)).make(),
        ),
      ),
    );
  }
}
















