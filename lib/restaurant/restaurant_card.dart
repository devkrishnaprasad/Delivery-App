import 'package:delivery_app/menu_page/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantsCard extends StatefulWidget {
  const RestaurantsCard({Key? key}) : super(key: key);

  @override
  State<RestaurantsCard> createState() => _RestaurantsCardState();
}

class _RestaurantsCardState extends State<RestaurantsCard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 20.h),
      child: InkWell(
        onTap: () {
          Get.to(const MenuItems());
        },
        child: Container(
          height: 195.h,
          width: 1.sw, // Use 1.sw to get the screen width
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(10.w), // Use ScreenUtil for radius
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2.w,
                blurRadius: 5.w,
                offset: const Offset(0, 2),
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                height: 115.h,
                width: 1.sw,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/item_img_2.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                height: 75.h,
                width: 1.sw,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 10.h, 0.w, 0.h),
                      child: Text(
                        'Meghana Foods',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp, // Use ScreenUtil for font size
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 0.h),
                          child: Text(
                            'Biriyani . Andhra . ₹350',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(130.w, 5.h, 0.w, 0.h),
                          child: Container(
                            width: 40.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.w),
                              color: Colors.green,
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10.w, 0.h, 0.w, 0.h),
                              child: Row(
                                children: [
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 10.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.w, 0.h, 0.w, 0.h),
                      child: Row(
                        children: [
                          Icon(Icons.keyboard_capslock),
                          Text(
                            '30 - 35 Minutes',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
