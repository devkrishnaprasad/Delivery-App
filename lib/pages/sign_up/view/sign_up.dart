import 'package:delivery_app/pages/billing/view/widget/payment/card_components/otp_validation_view.dart';
import 'package:delivery_app/pages/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      // resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WaveContainer(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 2.h, right: 20.w, left: 20.w),
                      child: TextFormField(
                        obscureText: false,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'Full name',
                          hintText: 'Enter full name',
                          labelStyle: const TextStyle(
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
                      child: TextFormField(
                        obscureText: false,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Email id',
                          labelStyle: const TextStyle(
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          hintText: 'Enter Contact number',
                          labelStyle: const TextStyle(
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
                      child: TextFormField(
                        obscureText: true,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          labelStyle: const TextStyle(
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
                      child: TextFormField(
                        obscureText: true,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          labelText: 'Re-enter passowrd',
                          hintText: 'Enter your password',
                          labelStyle: const TextStyle(
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 20.w, left: 30.w),
                      child: Text(
                        "Select Gender",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 0.h, right: 20.w, left: 20.w),
                      child: Row(
                        children: [
                          Radio(
                            value: 'male',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          Text('Male'),
                          Radio(
                            value: 'female',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          Text('Female'),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: Container(
                                    height: 200.h,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 20.w,
                                            top: 20.h,
                                          ),
                                          child: OTPWidget(),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20.h),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Get.to(
                                                    const LoginPage(),
                                                    transition:
                                                        Transition.fadeIn,
                                                    duration: const Duration(
                                                        milliseconds: 700),
                                                  );
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.green),
                                                  fixedSize:
                                                      MaterialStateProperty.all(
                                                          Size(
                                                              120.0.w, 30.0.h)),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Verify',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
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
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1.5.h,
                              indent: 8.0.w,
                              endIndent: 8.0.w,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: const Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1.5.h,
                              indent: 8.0.w,
                              endIndent: 8.0.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have account ?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
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
        height: 110.h,
        width: double.infinity,
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 40.w,
              ),
              child: Text(
                "Create",
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
                "Account",
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
