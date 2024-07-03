import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sircar/SignUp_Screen/login_screen.dart';
import 'package:sircar/SignUp_Screen/signup_screen.dart';
import 'package:sircar/consts/Strings.dart';
import 'package:sircar/firebase_options.dart';
import 'package:sircar/views/Home_screen/home_screen.dart';
import 'package:sircar/views/profile_screen/profile_screen.dart';
import 'package:sircar/views/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: AppName,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
    }

}
