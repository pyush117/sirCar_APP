import 'package:sircar/views/active_orders/webView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sircar/consts/Strings.dart';
import 'package:sircar/controllers/info_controller.dart';
import 'package:sircar/widgets_common/custom_textfield.dart';
import 'package:sircar/widgets_common/ourButton.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/colors.dart';
import '../../consts/lists.dart';

// class UserInformation extends StatefulWidget {
//   UserInformation({super.key});
//   final Map<String, String> Types = {
//     "0": "Dry",
//     "1": "BasicHatch",
//     "2": "BasciSedan",
//     "3": "BasicSuv",
//     "4": "PremiumHatch",
//     "5": "PremiumSedan",
//     "6": "PremiumSuv",
//   };
//
//   @override
//   State<UserInformation> createState() => _UserInformationState();
// }
//
// class _UserInformationState extends State<UserInformation> {
//   var dateController = TextEditingController();
//   var timeController = TextEditingController();
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//   var selectedIndex;
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<infoController>();
//
//     return Scaffold(
//       backgroundColor: white,
//       appBar: AppBar(
//         title: "Placing order".text.make().color(black),
//       ),
//       bottomNavigationBar: SizedBox(
//         height: 60,
//         child: ourBuutton(
//           onPress: () {
//             Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => const WebView()));
//           },
//           color: yellow,
//           textColor: white,
//           title: "Continue",
//         ),
//       ),
//       body: Column(
//         children: [
//           customTextField(
//               title: name,
//               hint: nameHint,
//               isPass: false,
//               controller: controller.nameController),
//           customTextField(
//               title: email,
//               hint: emailHint,
//               isPass: false,
//               controller: controller.emailController),
//           customTextField(
//               title: location,
//               hint: "",
//               isPass: false,
//               controller: controller.locationController),
//           customTextField(
//               title: contact,
//               hint: "",
//               isPass: false,
//               controller: controller.contactController),
//           customTextField(
//               title: date,
//               hint: "",
//               isPass: false,
//               onPress: () async {
//                 DateTime? datePicked = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime(2020, 06, 15),
//                     lastDate: DateTime(2025, 06, 12));
//                 if (datePicked != null && datePicked != selectedDate) {
//                   setState(() {
//                     selectedDate = datePicked;
//                     dateController.text =
//                         "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
//                   });
//                 }
//               },
//               controller: dateController),
//           customTextField(
//               title: date,
//               hint: "",
//               isPass: false,
//               onPress: () async {
//                 TimeOfDay? pickedTime = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.now(),
//                     initialEntryMode: TimePickerEntryMode.dial);
//                 if (pickedTime != null && pickedTime != selectedTime) {
//                   setState(() {
//                     selectedTime = pickedTime;
//                     timeController.text =
//                         "${selectedTime!.hour}:${selectedTime!.minute}";
//                   });
//                 }
//               },
//               controller: timeController),
//           customTextField(
//               title: address,
//               hint: "",
//               isPass: false,
//               controller: controller.addressController),
//           Expanded(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: 7,
//                 itemBuilder: (context, index) {
//                   return CheckboxListTile(
//                       activeColor: Colors.red,
//                       tristate: true,
//                       title: serviceTypes[index].text.make(),
//                       controlAffinity: ListTileControlAffinity.leading,
//                       value: selectedIndex == index,
//                       onChanged: (bool? newValue) {
//                         setState(() {
//                           if (selectedIndex == index) {
//                             selectedIndex = null;
//                           } else {
//                             selectedIndex = newValue! ? index : null;
//                           }
//                         });
//                       });
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
