import 'package:delivery_app/pages/menu_page/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MenuItemCard extends StatefulWidget {
  final String itemId;
  final String itemname;
  final String itemDesciption;
  final double rating;
  final String itemPrice;
  bool isVeg;
  final String imageUrl;

  MenuItemCard({
    Key? key,
    required this.itemId,
    required this.itemname,
    required this.itemDesciption,
    required this.rating,
    required this.itemPrice,
    required this.isVeg,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

MainMenuController _menuController = Get.find();

class _MenuItemCardState extends State<MenuItemCard> {
  @override
  void dispose() {
    _menuController.itemId.clear();
    super.dispose();
  }

  RxBool isItemAdded = false.obs;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(5.h, 10.w, 2.h, 10.w),
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
            Container(
              width: 195.w,
              height: 150.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 5.h, 0.w, 5.h),
                      child: Image(
                        image: widget.isVeg
                            ? const AssetImage('assets/icons/veg.png')
                            : const AssetImage('assets/icons/non-veg.png'),
                        width: 25.0.w,
                        height: 25.0.h,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 5.h, 0.w, 0.h),
                      child: Text(
                        widget.itemname,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 5.h, 0.w, 0.h),
                      child: Text(
                        widget.itemDesciption,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.h, 10.w, 0.h, 0.w),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: widget.rating,
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
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(width: 4.0),
                          const Text(
                            '3K ratings',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12.h, 10.w, 0.h, 0.w),
                      child: Text(
                        '₹${widget.itemPrice}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 156.w,
              height: 150.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 5.h, 0.w, 5.h),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: 166.w,
                            height: 130.h,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Container(
                                    width: 120.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: NetworkImage(widget.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () {
                                    return isItemAdded.value
                                        ? Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.h, 5.w, 5.h, 0.w),
                                            child: InkWell(
                                              onTap: () {
                                                _menuController
                                                        .carTotalPrice.value +=
                                                    int.parse(widget.itemPrice);

                                                _menuController.itemId
                                                    .add(widget.itemId);

                                                print(
                                                    "Item List : ${_menuController.itemId}");
                                                isItemAdded.value = true;
                                                _menuController
                                                    .cartItemCount.value = 1;
                                              },
                                              child: Container(
                                                width: 100.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: const Color.fromRGBO(
                                                      76, 175, 80, 1),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween, // Adjust this line
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          if (_menuController
                                                                  .cartItemCount
                                                                  .value ==
                                                              0) {
                                                            isItemAdded.value =
                                                                false;
                                                          } else {
                                                            _menuController
                                                                .cartItemCount
                                                                .value -= 1;

                                                            _menuController
                                                                    .carTotalPrice
                                                                    .value -=
                                                                int.parse(widget
                                                                    .itemPrice);

                                                            _menuController
                                                                .itemId
                                                                .remove(widget
                                                                    .itemId);
                                                            print(
                                                                "Item List : ${_menuController.itemId}");
                                                            _menuController
                                                                        .cartItemCount
                                                                        .value ==
                                                                    0
                                                                ? isItemAdded
                                                                        .value =
                                                                    false
                                                                : isItemAdded
                                                                        .value =
                                                                    true;
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
                                                            _menuController
                                                                .cartItemCount
                                                                .value
                                                                .toString(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10.sp,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          _menuController
                                                              .cartItemCount
                                                              .value += 1;
                                                          _menuController
                                                                  .carTotalPrice
                                                                  .value +=
                                                              int.parse(widget
                                                                  .itemPrice);
                                                          _menuController.itemId
                                                              .add(widget
                                                                  .itemId);
                                                          print(
                                                              "Item List ${_menuController.itemId}");
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
                                            padding: EdgeInsets.fromLTRB(
                                                10.h, 5.w, 5.h, 0.w),
                                            child: InkWell(
                                              onTap: () {
                                                isItemAdded.value = true;
                                                _menuController
                                                    .cartItemCount.value = 1;
                                                _menuController
                                                        .carTotalPrice.value +=
                                                    int.parse(widget.itemPrice);
                                                _menuController.itemId
                                                    .add(widget.itemId);
                                                print(
                                                    "Item List : ${_menuController.itemId}");
                                              },
                                              child: Container(
                                                width: 100.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10.sp),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                  },
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
