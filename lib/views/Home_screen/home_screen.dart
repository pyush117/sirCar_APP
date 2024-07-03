import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sircar/views/carWash_details/carWash_details.dart';
import 'package:sircar/widgets_common/bottomsheetButton.dart';
import 'package:sircar/widgets_common/exit_dialog.dart';
import 'package:sircar/widgets_common/homePageGridView.dart';
import 'package:sircar/widgets_common/homePageSwiper.dart';
import 'package:sircar/widgets_common/servicesTypes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/colors.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/profile_controlller.dart';
import '../../widgets_common/Searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var controller1 = Get.put(HomeController());
    var controller2 = Get.put(ProfileController());

    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (contex) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  searchBars(),
                  25.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller1.getUsername();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Stk()));
                        },
                        child: ServicesTypes(
                            boxshape: BoxShape.circle,
                            assetImagePath: "assets/images/carWash.png"),
                      ),
                      ServicesTypes(
                          boxshape: BoxShape.circle,
                          assetImagePath: "assets/images/quickfix.png"),
                      ServicesTypes(
                          boxshape: BoxShape.circle,
                          assetImagePath: "assets/images/coating.png"),
                      ServicesTypes(
                          boxshape: BoxShape.circle,
                          assetImagePath: "assets/images/mods.png"),
                    ],
                  ),
                  20.heightBox,
                  homePageSwiper(),
                  10.heightBox,
                  homePageGridView(),
                  10.heightBox,
                  Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Pricing")),
                  ), //pricing button
                  20.heightBox,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ServicesTypes(
                          borderRadius: BorderRadius.circular(10),
                          assetImagePath: "assets/images/carWash.png"),
                      ServicesTypes(
                          borderRadius: BorderRadius.circular(10),
                          assetImagePath: "assets/images/carWash.png"),
                      ServicesTypes(
                          borderRadius: BorderRadius.circular(10),
                          assetImagePath: "assets/images/carWash.png"),
                    ],
                  ),

                  15.heightBox,
                  BottomSheetButton(context,
                      title: "Why",
                      assetImagePath: "assets/images/AppLogo (2).png"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
