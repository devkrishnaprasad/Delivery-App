import 'package:delivery_app/billing/view/widget/order_item_card.dart';
import 'package:delivery_app/billing/view/widget/order_user_details.dart';
import 'package:delivery_app/billing/view/widget/payment/payment_options.dart';
import 'package:delivery_app/cart/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BillingWidget extends StatefulWidget {
  String restaurantName;
  BillingWidget({Key? key, required this.restaurantName}) : super(key: key);

  @override
  State<BillingWidget> createState() => _BillingWidgetState();
}

class _BillingWidgetState extends State<BillingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 40,
          ),
        ),
        actions: [
          InkWell(
            onTap: () => Get.to(
              const CartWidget(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 700),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: ImageIcon(
                const AssetImage('assets/icons/cart.png'),
                size: 40.0.dg,
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: Text(
          'Order Billing',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.h, 20.w, 0.h, 10.w),
            child: Text(
              widget.restaurantName,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index < 3) {
                  return Column(
                    children: [
                      const OrderItemCard(),
                      CustomPaint(
                        painter: DottedLinePainter(padding: 15.0.w),
                        child: Container(),
                      ),
                    ],
                  );
                } else {
                  return const OrderUserDetails();
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(2.h, 0.w, 2.h, 15.w),
            child: Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.h, 0.w, 0.h, 0.w),
                    child: Row(
                      children: [
                        Text(
                          "Total Price :",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "₹50",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40.h, 0.w, 0.h, 0.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0.h,
                          horizontal: 15.0.w,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return PaymentOptions();
                          },
                        );
                      },
                      child: Text(
                        "Place Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final double padding;

  DottedLinePainter({this.padding = 16.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    final double dashWidth = 5.0;
    final double dashSpace = 5.0;

    double currentX = padding;

    while (currentX < size.width - padding) {
      canvas.drawLine(
        Offset(currentX, 0.0),
        Offset(currentX + dashWidth, 0.0),
        paint,
      );

      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
