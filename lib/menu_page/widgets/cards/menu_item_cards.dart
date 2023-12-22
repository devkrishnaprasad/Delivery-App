import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

RxBool isItemAdded = false.obs;
RxInt itemCount = 0.obs;
bool isNoVeg = true;

class MenuItemCard extends StatefulWidget {
  const MenuItemCard({super.key});

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Container(
        width: width,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 5.h, 0.w, 5.h),
                  child: Image(
                    image: isNoVeg
                        ? const AssetImage('assets/icons/non-veg.png')
                        : const AssetImage('assets/icons/veg.png'),
                    width: 25.0.w,
                    height: 25.0.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 0.h, 0.w, 0.h),
                  child: const Text(
                    'Meghana Special Biryani',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.h, 0.w, 0.h, 0.w),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        itemSize: 15.0,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                          width:
                              4.0), // Add a small space between the RatingBar and Text
                      const Text(
                        '3K ratings',
                        style: TextStyle(
                          fontSize: 12, // Adjust the font size
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.h, 14.w, 0.h, 0.w),
                  child: const Text(
                    '₹259',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                width: 166.w,
                height: 400.h,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                      child: Container(
                        width: 120.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/dish_img_1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () {
                        return isItemAdded.value
                            ? Padding(
                                padding: const EdgeInsets.fromLTRB(40, 5, 5, 0),
                                child: InkWell(
                                  onTap: () {
                                    isItemAdded.value = true;
                                    itemCount.value = 1;
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color:
                                          const Color.fromRGBO(76, 175, 80, 1),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween, // Adjust this line
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (itemCount.value == 1) {
                                                isItemAdded.value = false;
                                              } else {
                                                itemCount.value -= 1;
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.minimize,
                                              size: 18,
                                            ),
                                            color: Colors.white,
                                          ),
                                          Obx(
                                            () {
                                              return Text(
                                                itemCount.value.toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              itemCount.value += 1;
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              size: 18,
                                            ),
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.fromLTRB(40, 5, 5, 0),
                                child: InkWell(
                                  onTap: () {
                                    isItemAdded.value = true;
                                    itemCount.value = 1;
                                  },
                                  child: Container(
                                      width: 100.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
