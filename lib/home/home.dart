import 'package:delivery_app/cart/cart.dart';
import 'package:delivery_app/home/controller/home_controller.dart';
import 'package:delivery_app/order_history/all_orders.dart';
import 'package:delivery_app/restaurant/restaurant_page.dart';
import 'package:delivery_app/user_profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedPageIndex = 0;
List pages = const [
  RestaurantMainPage(),
  AllOrders(),
  Cart(),
];

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.h, 0.w, 15.h, 0.w),
            child: InkWell(
              onTap: () {
                Get.to(const UserProfile());
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: SizedBox(
                  width: 60.w,
                  height: 60.h,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/My_profile.jpeg',
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
                size: 40.0,
                color: Color.fromARGB(255, 110, 91, 91),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: TextStyle(
                    fontFamily: 'Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Maruthi Nagar, Madiwala,Ba...",
                  style: TextStyle(
                      fontFamily: '',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        leadingWidth: 300,
      ),
      // bottomNavigationBar: Container(
      //   height: 70.h,
      //   margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      //   decoration: BoxDecoration(
      //     boxShadow: [
      //       BoxShadow(
      //           color: Colors.black.withOpacity(0.5),
      //           blurRadius: 25,
      //           offset: Offset(8, 20))
      //     ],
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       ClipRRect(
      //         borderRadius: BorderRadius.circular(20),
      //         child: BottomNavigationBar(
      //           backgroundColor: Colors.white,
      //           selectedItemColor: Colors.red,
      //           unselectedItemColor: Colors.black,
      //           currentIndex: currentIndex,
      //           onTap: (index) {
      //             setState(() {
      //               currentIndex = index;
      //             });
      //           },
      //           items: const [
      //             BottomNavigationBarItem(
      //                 icon: Icon(Icons.home), label: 'Home'),
      //             BottomNavigationBarItem(
      //                 icon: Icon(Icons.home), label: 'Orders'),
      //             BottomNavigationBarItem(
      //                 icon: Icon(Icons.home), label: 'Cart'),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Obx(
        () {
          return _homeController.isloading.value
              ? Center(
                  child: LoadingAnimationWidget.twistingDots(
                    leftDotColor: const Color(0xFF1A1A3F),
                    rightDotColor: const Color(0xFFEA3799),
                    size: 200,
                  ),
                )
              : RestaurantMainPage();
        },
      ),
    );
  }
}
