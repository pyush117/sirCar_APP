import 'package:flutter/material.dart';
import 'package:sircar/consts/colors.dart';
import 'package:sircar/views/carWash_details/card.dart';
import 'package:velocity_x/velocity_x.dart';

class ServiceDetails extends StatelessWidget {
   final String? title;
  final String? content;

  ServiceDetails({  this.title,   this.content});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: yellow,
                ),
                child: Center(
                  child: Text(title.toString()),
                ),
              ),
              15.widthBox,
              Expanded(
                  child: Container(
                child: Center(
                  child: Text(
                    content.toString(),
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ).box.height(70).width(50).color(white).make())
            ],
          ),
          15.heightBox,
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CustomCard(
                      title: "sircar",
                      content: "xyz",
                      width: 75,
                    ),
                    CustomCard(
                      title: "sircar",
                      content: "xyz",
                      width: 75,
                    ),
                    CustomCard(
                      title: "sircar",
                      content: "xyz",
                      width: 75,
                    ),
                    CustomCard(
                      title: "sircar",
                      content: "xyz",
                      width: 75,
                    ),
                  ],
                ).box.width(context.screenWidth).make(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
