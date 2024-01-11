import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'dart:async';

class OTPWidget extends StatefulWidget {
  const OTPWidget({Key? key}) : super(key: key);

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;

  @override
  void initState() {
    super.initState();
    startTimer();
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.green,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Enter your OTP',
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.w),
              child: _secondsRemaining > 0
                  ? Text(
                      '00:$_secondsRemaining resent OTP in.',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.blue,
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
                          color: Colors.blue,
                        ),
                      ),
                    ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.h, 25.w, 0.h, 0.w),
          child: Column(
            children: [
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                validator: (s) {
                  return s == '111111' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
