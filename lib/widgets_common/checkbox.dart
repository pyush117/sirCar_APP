// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// import '../consts/lists.dart';
// class checkBoxes extends StatefulWidget {
//   final checked;
//   const checkBoxes({super.key, this.checked});
//
//   @override
//   State<checkBoxes> createState() => _checkBoxesState();
// }
//
// class _checkBoxesState extends State<checkBoxes> {
//   var selectedIndex;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  ListView.builder(
//         shrinkWrap: true,
//         itemCount: 7,
//         itemBuilder: (context, index) {
//           return CheckboxListTile(
//               activeColor: Colors.red,
//               tristate: true,
//               title: serviceTypes[index].text.make(),
//               controlAffinity: ListTileControlAffinity.leading,
//               value: selectedIndex == index,
//               onChanged: (bool? newValue) {
//                 setState(() {
//                   if (selectedIndex == index) {
//                     selectedIndex = null;
//                   } else {
//                     selectedIndex = newValue! ? index : null;
//                     checked=
//
//                   }
//                 });
//               });
//         });
//   }
// }
