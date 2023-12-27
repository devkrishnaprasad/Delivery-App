import 'package:delivery_app/cart/cart.dart';
import 'package:delivery_app/menu_page/menu_controller.dart';
import 'package:delivery_app/menu_page/widgets/cards/menu_item_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

MainMenuController _mainMenuController = Get.put(MainMenuController());

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 25,
            ),
          )
        ],
      ),
      bottomNavigationBar: Obx(() {
        return Visibility(
          visible: _mainMenuController.cartItemCount.value != 0,
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.h, 0.w, 0.h, 18.w),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(
                    0.0), // Set the alpha channel to 0.0 for transparency
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.h, 0.w, 0.h, 0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Cart());
                      },
                      child: Container(
                        width: 150.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.h, 0, 0, 0),
                              child: ImageIcon(
                                AssetImage('assets/icons/cart.png'),
                                size: 25.0.dg,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.h, 0, 0, 0),
                              child: Text(
                                _mainMenuController.cartItemCount.value
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  fontFamily: 'ch',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5.h, 0, 0, 0),
                              child: Text(
                                _mainMenuController.cartItemCount.value == 1
                                    ? 'Item'
                                    : 'Items',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  fontFamily: 'ch',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(2.h, 0, 0, 0),
                              child: ImageIcon(
                                const AssetImage(
                                    'assets/icons/forward_icon.png'),
                                color: Colors.white,
                                size: 18.dg,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 0.h),
              child: SizedBox(
                width: 1.sw,
                height: 120.h,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                      child: Text(
                        'Meghana Foods',
                        // 'Testing Item',
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                      child: Text(
                        'Biryani . Andhra . North Indian',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(125.w, 10.h, 0.w, 0.h),
                            child: Container(
                              width: 40.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.w),
                                color: Colors.green,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(8.w, 0.h, 0.w, 0.h),
                                    child: Text(
                                      '4.3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(3.w, 1.h, 0.w, 2.h),
                                    child: Icon(
                                      Icons.star,
                                      size: 8.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(6.w, 8.h, 0.w, 0.h),
                            child: Text(
                              '96.6K ratings',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
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
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return MenuItemCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}
