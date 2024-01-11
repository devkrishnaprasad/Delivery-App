import 'package:delivery_app/pages/login/view/login.dart';
import 'package:delivery_app/pages/onboarding_screens/screen_1.dart';
import 'package:delivery_app/pages/onboarding_screens/screen_2.dart';
import 'package:delivery_app/pages/onboarding_screens/screen_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: const [
              SplashScreenSlideOne(),
              SplashScreenSlideTwo(),
              SplashScreenSlideThree(),
            ],
          ),
          Container(
            alignment: AlignmentDirectional(0.74.w, 0.67.h),
            child: TextButton(
              onPressed: () {
                _currentPage < 2
                    ? _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                    : Get.to(
                        LoginPage(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 700),
                      );
              },
              child: Text(
                _currentPage < 2 ? 'Next' : 'Get Started',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment(0.w, 0.65.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
