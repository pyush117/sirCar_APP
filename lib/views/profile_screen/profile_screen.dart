import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sircar/SignUp_Screen/login_screen.dart';
import 'package:sircar/consts/firebase_consts.dart';
import 'dart:io';
import 'package:sircar/consts/images.dart';
import 'package:sircar/controllers/Services/firestore_services.dart';
import 'package:sircar/controllers/auth_contoller.dart';
import 'package:sircar/controllers/profile_controlller.dart';
import 'package:sircar/views/profile_screen/editProfile_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/colors.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   void _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(ProfileController());
//     return Scaffold(
//       backgroundColor: yellow,
//       body: StreamBuilder(
//         stream: FireStoreServices.getUser(currentUser!.uid),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation(yellow),
//               ),
//             );
//           } else {
//             var data = snapshot.data!.docs[0];
//             return SafeArea(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // Edit icon
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Align(
//                         alignment: Alignment.topRight,
//                         child: const Icon(
//                           Icons.edit,
//                           color: Colors.white,
//                         ).onTap(() {
//                           controller.nameController.text = data['name'];
//                           Get.to(() => EditProfileScreen(data: data));
//                         }),
//                       ),
//                     ),
//                     // Profile Picture
//                     Center(
//                       child: Column(
//                         children: [
//                           data['imageUrl'] == ''
//                               ? Image.asset(defaultProfile,
//                                       width: 100, fit: BoxFit.cover)
//                                   .box
//                                   .roundedFull
//                                   .clip(Clip.antiAlias)
//                                   .make()
//                               : Image.network(data['imageUrl'],
//                                       width: 100, fit: BoxFit.cover)
//                                   .box
//                                   .roundedFull
//                                   .clip(Clip.antiAlias)
//                                   .make(),
//                           const SizedBox(height: 16),
//                           Text(
//                             data['name'],
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             data['email'],
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     // User Information Box
//                     Container(
//                       padding: const EdgeInsets.all(20.0),
//                       margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'User Information',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           buildUserInfoRow('Name:', data['name']),
//                           const SizedBox(height: 10),
//                           buildUserInfoRow('Email:', data['email']),
//                           const SizedBox(height: 10),
//                           buildUserInfoRow(
//                             'Account Created On:',
//                             formatTimestamp(data['Account_created']),
//                           ),
//                           // Add more information rows as needed
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     // Logout Button
//                     OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Colors.white),
//                       ),
//                       onPressed: () async {
//                         await Get.put(AuthController()).signOutMethod(context);
//                         Get.offAll(() => const LoginScreen());
//                       },
//                       child: const Text(
//                         'Logout',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     const SizedBox(height: 250),
//                     // Creative Footer with Website URL
//                     Container(
//                       padding: const EdgeInsets.all(40.0),
//                       margin: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//                           const Text(
//                             'Visit Our Website',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           GestureDetector(
//                             onTap: () => _launchURL('https://thesircar.com/'),
//                             child: const Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.web, color: Colors.white),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   'www.yourwebsite.com',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     decoration: TextDecoration.underline,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   String formatTimestamp(Timestamp timestamp) {
//     var dateTime = timestamp.toDate();
//     var formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
//     return formattedDate;
//   }
//
//   Widget buildUserInfoRow(String label, String value) {
//     return Row(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(width: 8),
//         Expanded(
//           child: Text(
//             value,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: yellow,
      body: StreamBuilder(
        stream: FireStoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(yellow),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Edit icon
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ).onTap(() {
                          controller.nameController.text = data['name'] ?? '';
                          Get.to(() => EditProfileScreen(data: data));
                        }),
                      ),
                    ),
                    // Profile Picture
                    Center(
                      child: Column(
                        children: [
                          (data['imageUrl'] == null || data['imageUrl'] == '')
                              ? Image.asset(defaultProfile,
                              width: 100, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make()
                              : Image.network(data['imageUrl'],
                              width: 100, fit: BoxFit.cover)
                              .box
                              .roundedFull
                              .clip(Clip.antiAlias)
                              .make(),
                          const SizedBox(height: 16),
                          Text(
                            data['name'] ?? 'N/A',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            data['email'] ?? 'N/A',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    // User Information Box
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User Information',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          buildUserInfoRow('Name:', data['name'] ?? 'N/A'),
                          const SizedBox(height: 10),
                          buildUserInfoRow('Email:', data['email'] ?? 'N/A'),
                          const SizedBox(height: 10),
                          buildUserInfoRow(
                            'Account Created On:',
                            data['Account_created'] != null
                                ? formatTimestamp(data['Account_created'])
                                : 'N/A',
                          ),
                          // Add more information rows as needed
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Logout Button
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () async {
                        await Get.put(AuthController()).signOutMethod(context);
                        Get.offAll(() => const LoginScreen());
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 250),
                    // Creative Footer with Website URL
                    Container(
                      padding: const EdgeInsets.all(40.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Visit Our Website',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => _launchURL('https://thesircar.com/'),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.web, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  'www.yourwebsite.com',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  String formatTimestamp(Timestamp timestamp) {
    var dateTime = timestamp.toDate();
    var formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  Widget buildUserInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}





