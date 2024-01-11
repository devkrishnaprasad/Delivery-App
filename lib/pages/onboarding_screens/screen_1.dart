import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenSlideOne extends StatefulWidget {
  const SplashScreenSlideOne({super.key});

  @override
  State<SplashScreenSlideOne> createState() => _SplashScreenSlideOneState();
}

class _SplashScreenSlideOneState extends State<SplashScreenSlideOne> {
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
                image:
                    AssetImage('assets/images/onboard_images/Order_food.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'ORDER YOUR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'FOOD NOW',
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
