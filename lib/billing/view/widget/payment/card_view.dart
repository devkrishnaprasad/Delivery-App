import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardViewWidget extends StatefulWidget {
  const CardViewWidget({super.key});

  @override
  State<CardViewWidget> createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your card details',
          style: TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
