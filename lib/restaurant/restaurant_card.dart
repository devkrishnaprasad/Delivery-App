import 'package:delivery_app/home/controller/home_controller.dart';
import 'package:delivery_app/menu_page/menu_controller.dart';
import 'package:delivery_app/menu_page/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantsCard extends StatefulWidget {
  final String restaurantName;
  final String discription;
  final String imageUrl;
  final String rating;
  final String restaurantId;

  const RestaurantsCard({
    Key? key,
    required this.restaurantName,
    required this.discription,
    required this.imageUrl,
    required this.rating,
    required this.restaurantId,
  }) : super(key: key);

  @override
  State<RestaurantsCard> createState() => _RestaurantsCardState();
}

class _RestaurantsCardState extends State<RestaurantsCard> {
  final HomeController _homeController = Get.find();
  final MainMenuController _mainMenuController = Get.put(MainMenuController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 20.h),
      child: InkWell(
        onTap: () async {
          _mainMenuController.restaurantId.value = widget.restaurantId;
          Get.to(
            MenuItems(
              restaurantId: widget.restaurantId,
              restaurantName: widget.restaurantName,
              restaurantDescription: widget.discription,
              restaurantRating: widget.rating,
            ),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 700),
          );
          await _homeController.getMenuItes(widget.restaurantId);
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80.h,
                        width: 340.w, // Set the width to 1.sw
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 80.h,
                                width: 220.w,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            15.h, 15.w, 0.h, 0.w),
                                        child: Text(
                                          widget.restaurantName,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            15.h, 0.w, 0.h, 0.w),
                                        child: Text(
                                          widget.discription,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            15.h, 4.w, 0.h, 0.w),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.keyboard_capslock),
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  height: 80.h,
                                  width: 120.w,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 40.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.w),
                                          color: Colors.green),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.w, 0.h, 0.w, 0.h),
                                        child: Row(
                                          children: [
                                            Text(
                                              widget.rating,
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
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
