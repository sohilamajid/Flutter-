import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi/bmi_screen.dart';
import 'ecommerce/onboarding/onboarding_screen.dart';
import 'ecommerce/splash/splash_screen.dart';
import 'messenger/messenger_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
