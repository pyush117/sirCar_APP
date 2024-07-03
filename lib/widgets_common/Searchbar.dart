import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sircar/SignUp_Screen/signup_screen.dart';
import 'package:sircar/consts/images.dart';
import 'package:sircar/views/profile_screen/profile_screen.dart';
import 'package:velocity_x/velocity_x.dart';


class searchBars extends StatefulWidget {
  const searchBars({super.key});

  @override
  State<searchBars> createState() => _searchBarState();
}

class _searchBarState extends State<searchBars> {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return buildSearchBar(context, null);
    } else {
      return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          var userDoc = snapshot.data?.data();
          String? profileImage = userDoc?['imageUrl'] as String?;
          return buildSearchBar(context, profileImage);
        },
      );
    }
  }

  Widget buildSearchBar(BuildContext context, String? profileImage) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  left: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  hintText: 'Search...',
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            height: null,
            width: null,
            child: IconButton(
              icon: profileImage == null || profileImage.isEmpty
                  ? const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(defaultProfile),
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(profileImage, scale: 1.0),
                    ),
              iconSize: 50,
              onPressed: () {
                if (FirebaseAuth.instance.currentUser == null) {
                  Get.to(() => SignUpScreen());
                  VxToast.show(context, msg: "Sign Up");
                } else {
                  Get.to(() => ProfileScreen());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
