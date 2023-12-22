import 'package:delivery_app/menu_page/widgets/cards/menu_item_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

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
              itemCount: 10,
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
