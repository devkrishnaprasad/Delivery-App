import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItemCard extends StatefulWidget {
  const OrderItemCard({super.key});

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

bool isVeg = true;

class _OrderItemCardState extends State<OrderItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(7.h, 0.w, 7.h, 0.w),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            height: 50.h,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: 195.w,
                  height: 50.h,
                  // color: Colors.green,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10.w, 5.h, 0.w, 5.h),
                              child: Image(
                                image: isVeg
                                    ? const AssetImage('assets/icons/veg.png')
                                    : const AssetImage(
                                        'assets/icons/non-veg.png'),
                                width: 15.0.w,
                                height: 15.0.h,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10.w, 5.h, 0.w, 0.h),
                              child: const Text(
                                "Item 1",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(35.w, 0.h, 0.w, 0.h),
                          child: const Text(
                            "Price",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            softWrap: true,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 147.5.w,
                  height: 50.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.h, 5.w, 10.h, 0.w),
                          child: Container(
                            width: 90.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green, width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    print("Sub button pressed...");
                                  },
                                  child: Icon(
                                    Icons.minimize,
                                    size: 18.sp,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 16.0.w),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 13.0.sp,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 16.0.w),
                                InkWell(
                                  onTap: () {
                                    print("Add Button pressed.......");
                                  },
                                  child: Icon(
                                    Icons.add,
                                    size: 18.sp,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25.h, 2.w, 0.h, 0.w),
                        child: Text(
                          "₹10",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
