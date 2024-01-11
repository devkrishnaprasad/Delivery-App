import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderUserDetails extends StatefulWidget {
  const OrderUserDetails({super.key});

  @override
  State<OrderUserDetails> createState() => _OrderUserDetailsState();
}

class _OrderUserDetailsState extends State<OrderUserDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.h, 25.w, 5.h, 0.w),
      child: Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2.w,
              blurRadius: 5.w,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0.h, 20.0.w, 0.0.h, 0.0.w),
                  child: SizedBox(
                    width: 20.0.w,
                    height: 20.0.h,
                    child: Image.asset(
                      'assets/icons/timer_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 20, 0, 0),
                  child: const Text(
                    'Delivery in 30 - 35 mins',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 15.w, 0.h, 0.w),
                  child: SizedBox(
                    width: 20.0.w,
                    height: 20.0.h,
                    child: const Icon(
                      Icons.home,
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 15.w, 0, 0),
                  child: const Text(
                    'Delivery at Home',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(37.h, 0, 0, 0),
              child: const Text(
                '26 house number 4th floor, Taverakere, Maruthi Nagar, Madiwala',
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 15.w, 0.h, 0.w),
                  child: SizedBox(
                    width: 20.0.w,
                    height: 20.0.h,
                    child: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 15.w, 0, 0),
                  child: const Text(
                    'Krishna KP,',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.h, 15.w, 0, 0),
                  child: const Text(
                    '+91-9539873221',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 15.w, 0.h, 0.w),
                  child: SizedBox(
                    width: 20.0.w,
                    height: 20.0.h,
                    child: Image.asset(
                      'assets/icons/bill_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 15.w, 0, 0),
                  child: const Text(
                    'Total Bill : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.h, 15.h, 0, 0),
                  child: const Text(
                    '₹200',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
