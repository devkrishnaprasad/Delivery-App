import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SizedBox(
              width: 20.w,
              height: 20.h,
              child: Image.asset(
                'assets/icons/back_icon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ]),
      ),
      body: const Center(
        child: Text('Cart page'),
      ),
    );
  }
}
