import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
User?currentUser=auth.currentUser;
const usersCollection="users";
const bookingCollection="booking";

// controller.bookMySlot(
//     selectedCheckBox: selectedIndex.toString(),
//     serviceDate: selectedDate.toString(),
//     serviceTime: selectedTime.toString());
// VxToast.show(context, msg: "slot Booked");
//  send_mail(
//     orderTime: FieldValue.serverTimestamp().toString(),
//     name: Get.find<HomeController>().username,
//     serviceDate: selectedDate.toString(),
//     serviceTime: selectedTime.toString(),
//     email: currentUser!.email.toString(),
//     address: controller.addressController.toString(),
//     contact: controller.contactController.toString(),
//     id: currentUser!.uid.toString(),
//     location: controller.locationController.toString(),
//     selectedCheckBox:
//         Types[selectedIndex].toString() ?? "No value found");

//Get.to(() => ActiveBookingScreen());
//));