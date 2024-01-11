import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenSlideTwo extends StatefulWidget {
  const SplashScreenSlideTwo({super.key});

  @override
  State<SplashScreenSlideTwo> createState() => _SplashScreenSlideTwoState();
}

class _SplashScreenSlideTwoState extends State<SplashScreenSlideTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Container(
            height: 290.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/onboard_images/pickup.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'SERVER 2',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'DEVELOPMENT',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Text(
              'Do not use it in a production deployment. Use a production WSGI server instead.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
