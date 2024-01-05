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
        )
      ],
    );
  }
}
