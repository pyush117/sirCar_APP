import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sircar/SignUp_Screen/signup_screen.dart';
import 'package:sircar/views/active_orders/webView.dart';

void checkUserLogin(BuildContext context) async {
User? currentUser = FirebaseAuth.instance.currentUser;
if (currentUser == null) {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text('Login Required'),
content: Text('Please log in first to access this page.'),
actions: [
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text('Close'),
),
TextButton(
onPressed: () {
Navigator.of(context).pop();
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => const SignUpScreen()),
);
},
child: const Text('Sign Up'),
),
],
);
},
);
} else {
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => const WebViewPage()),
);
}
}