import 'package:flutter/material.dart';
import 'package:sircar/views/carWash_details/card.dart';
import 'package:sircar/widgets_common/homePageSwiper.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../SignUp_Screen/check_credentials.dart';
import '../../consts/colors.dart';


class ServiceDescription extends StatelessWidget {
  const ServiceDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dry Wash @99",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: const Center(
                        child: Text("BOOK YOUR SLOT"),
                      ),
                    ),
                  ],
                ),
                20.heightBox,
                SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomCard(
                        title: "SUV",
                        width: context.screenWidth /4,
                        content: "@99",
                      ),
                      CustomCard(
                        title: "SEDAN",
                        width: context.screenWidth / 4,
                        content: "@99",
                      ),
                      CustomCard(
                        title: "HETCHBACK",
                        width: context.screenWidth / 3,
                        content: "@99",
                      ),
                      CustomCard(
                        title: "SUV",
                        width: context.screenWidth / 4,
                        content: "@99",
                      ),
                    ],
                  )
                      .box
                      .color(yellow)
                      .make(),
                ),
                20.heightBox,
                homePageSwiper(),
                20.heightBox,
                Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: yellow,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text("Exterior Wipe Down"),
                        20.heightBox,
                      ],
                    ),
                  ),
                ),
                25.heightBox,
                InkWell(
                  onTap: () {
                    checkUserLogin(context);
                  },
                  child: Container(
                    height: 50,
                    width: context.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow,
                    ),
                    child: const Center(
                      child: Text("BOOK YOUR SLOT"),
                    ),
                  ),
                ),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
