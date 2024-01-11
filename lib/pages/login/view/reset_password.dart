import 'dart:async';

import 'package:delivery_app/pages/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;
  RxBool isOtpEnabled = false.obs;
  RxBool isChnagePasswordEnabled = false.obs;
  RxBool isHideEmail = true.obs;

  @override
  void initState() {
    super.initState();

    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.grey,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining -= 1;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int _secondsRemaining = 60;
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WaveContainer(),
            SizedBox(
              height: 90.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Obx(
                          () {
                            return Text(
                              isChnagePasswordEnabled.value
                                  ? "Change Password"
                                  : "Reset Password",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            );
                          },
                        ),
                      ),
                      Obx(
                        () {
                          return Visibility(
                            visible: isHideEmail.value,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20.h, right: 20.w, left: 20.w),
                              child: TextFormField(
                                obscureText: false,
                                cursorColor: Colors.green,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'Enter registred email id',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelStyle: const TextStyle(
                                    color: Colors.green,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .green, // Set your desired color for the focused border
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Obx(
                        () {
                          return Visibility(
                            visible: isChnagePasswordEnabled.value,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.h, right: 20.w, left: 20.w),
                                  child: TextFormField(
                                    obscureText: true,
                                    cursorColor: Colors.green,
                                    decoration: InputDecoration(
                                      labelText: 'New Password',
                                      hintText: 'New password',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      labelStyle: const TextStyle(
                                        color: Colors.green,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .green, // Set your desired color for the focused border
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.h, right: 20.w, left: 20.w),
                                  child: TextFormField(
                                    obscureText: true,
                                    cursorColor: Colors.green,
                                    decoration: InputDecoration(
                                      labelText: 'Re-Enter password',
                                      hintText: 'Enter password',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      labelStyle: const TextStyle(
                                        color: Colors.green,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: const BorderSide(
                                          color: Colors
                                              .green, // Set your desired color for the focused border
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Obx(
                        () {
                          return Visibility(
                            visible: isOtpEnabled.value,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.h, right: 20.w),
                                      child: _secondsRemaining > 0
                                          ? Text(
                                              '00:$_secondsRemaining resent OTP in.',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.green,
                                              ),
                                            )
                                          : TextButton(
                                              onPressed: () {
                                                print("Resend OTP ");
                                              },
                                              child: Text(
                                                'Resend OTP',
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5.h, right: 20.w, left: 20.w),
                                  child: Pinput(
                                    length: 6,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: focusedPinTheme,
                                    submittedPinTheme: submittedPinTheme,
                                    validator: (s) {
                                      return s == '111111'
                                          ? null
                                          : 'Pin is incorrect';
                                    },
                                    pinputAutovalidateMode:
                                        PinputAutovalidateMode.onSubmit,
                                    showCursor: true,
                                    onCompleted: (pin) => print(pin),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (isChnagePasswordEnabled.value) {
                                  Get.to(
                                    const LoginPage(),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 700),
                                  );
                                }
                                if (!isOtpEnabled.value) {
                                  isOtpEnabled.value = true;
                                  startTimer();
                                } else {
                                  isChnagePasswordEnabled.value = true;
                                  isHideEmail.value = false;
                                  isOtpEnabled.value = false;
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                                fixedSize: MaterialStateProperty.all(
                                    Size(120.0.w, 30.0.h)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              child: Obx(() {
                                return Text(
                                  isChnagePasswordEnabled.value
                                      ? 'Save'
                                      : 'Verify',
                                  style: const TextStyle(color: Colors.white),
                                );
                              })),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: 170.h,
        width: double.infinity,
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40.w,
              ),
              child: Text(
                "Welecome",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40.w,
              ),
              child: Text(
                "Back",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(
          0,
          size.height -
              50.h) // Adjusted the starting point to leave some space at the top
      ..quadraticBezierTo(size.width / 4, size.height, size.width / 2,
          size.height - 20.h) // First curve
      ..quadraticBezierTo(size.width * 3 / 4, size.height - 50.h, size.width,
          size.height - 10.h) // Second curve
      ..lineTo(size.width, 0) // Line back to the top
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
