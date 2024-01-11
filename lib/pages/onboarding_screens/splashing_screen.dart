import 'dart:async';
import 'package:delivery_app/pages/home/home.dart';
import 'package:delivery_app/pages/onboarding_screens/onboarding_screen.dart';
import 'package:delivery_app/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      LocalStorage localStorage = LocalStorage();
      var userId = await localStorage.read('user_id');
      print("The user Id : $userId");
      Get.offAll(
        userId != null ? const HomePage() : const OnboardingScreen(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 700),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboard_images/splash_image.jpg',
              height: 200.0.h,
              width: 200.0.w,
              fit: BoxFit.contain,
            ),
            Text(
              "GoGo..",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
