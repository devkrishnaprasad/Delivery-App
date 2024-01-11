import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpiViewWidget extends StatefulWidget {
  const UpiViewWidget({super.key});

  @override
  State<UpiViewWidget> createState() => _UpiViewWidgetState();
}

class _UpiViewWidgetState extends State<UpiViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Enter your UPI ID',
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.h, 25.w, 0.h, 0.w),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "UPI ID",
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 12.0.w, horizontal: 10.0.h),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0.w),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
