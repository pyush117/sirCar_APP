import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sircar/consts/firebase_consts.dart';
import 'package:sircar/controllers/home_controller.dart';

import '../consts/lists.dart';

class infoController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var locationController = TextEditingController();
  var contactController = TextEditingController();
  var addressController = TextEditingController();

  bookMySlot(
      {required String? selectedCheckBox,
      required String serviceDate,
      required String serviceTime}) async {
    await firestore.collection(bookingCollection).doc().set({
      "booked_by": currentUser!.uid,
      "booked_by_name": Get.find<HomeController>().username,
      'order_date': FieldValue.serverTimestamp(),
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_phone': contactController.text,
      'order_by_location': locationController.text,
      "order_status": false,
      "service_type": selectedCheckBox,
      "service_time": serviceTime,
      "service_date": serviceDate,
    });
  }
}
