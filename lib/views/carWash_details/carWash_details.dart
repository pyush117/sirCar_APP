import 'package:flutter/material.dart';
import 'package:sircar/consts/colors.dart';
import 'package:sircar/views/carWash_details/card.dart';
import 'package:sircar/views/carWash_details/service_description.dart';
import 'package:sircar/views/carWash_details/service_details.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets_common/bottomsheetButton.dart';
import '../../widgets_common/homePageSwiper.dart';

class carWashDetails extends StatelessWidget {
  const carWashDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(

            children: [
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell( onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServiceDescription()),
                    );
                  },
                    child: CustomCard(
                      title: "sircar",
                      content: "xyz",
                      width: 110,
                    ),
                  ),
                  CustomCard(
                    title: "sircar",
                    content: "xyz",
                    width: 110,
                  ),
                  CustomCard(
                    title: "sircar",
                    content: "xyz",
                    width: 110,
                  ),
                ],
              ).box.width(context.screenWidth).make(),
              20.heightBox,
              homePageSwiper(),
              25.heightBox,
              ServiceDetails(
                title: 'DRY',
                content:
                    'Keep your skills sharp with quick daily challenges on desktop or Mobile app. You earn XP for every practice round',
              ),
              10.heightBox,
              ServiceDetails(
                title: 'BASIC',
                content:
                    'Keep your skills sharp with quick daily challenges on desktop or Mobile app. You earn XP for every practice roundR',
              ),
              10.heightBox,
              ServiceDetails(
                title: 'PREMIUM',
                content:
                    'Keep your skills sharp with quick daily challenges on desktop or Mobile app. You earn XP for every practice round',
              ),
              10.heightBox,
              Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: yellow,
                ),
                child: const Center(
                  child: Text("ADD-ONs"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    title: "sircar",
                    content: "xyz",
                    width: 110,
                  ),
                  CustomCard(
                    title: "sircar",
                    content: "xyz",
                    width: 110,
                  ),
                  CustomCard(
                    title: "sircar",
                    content: "xyz",
                    width: 110,
                  ),
                ],
              ).box.width(context.screenWidth).make(),
              10.heightBox,
            ],
          ),
        ),
      ),
    ));
  }
}

class Stk extends StatelessWidget {
  const Stk({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        carWashDetails(),
        Positioned(
            top: 877,
            left: 8,
            right: 8,
            child: BottomSheetButton(context, title: "Why cleaning is important")),
      ],
    );
  }
}
