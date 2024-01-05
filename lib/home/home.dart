import 'package:delivery_app/cart/view/cart_view.dart';
import 'package:delivery_app/home/controller/home_controller.dart';
import 'package:delivery_app/order_history/all_orders.dart';
import 'package:delivery_app/restaurant/restaurant_page.dart';
import 'package:delivery_app/user_profile/view/profile.dart';
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
  CartWidget(),
];

class _HomePageState extends State<HomePage> {
  HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.h, 0.w, 15.h, 0.w),
            child: InkWell(onTap: () {
              Get.to(
                const UserProfile(),
                transition: Transition.fade,
                duration: const Duration(milliseconds: 700),
              );
            }, child: Obx(() {
              return CircleAvatar(
                backgroundColor: Colors.transparent,
                child: SizedBox(
                  width: 60.w,
                  height: 60.h,
                  child: ClipOval(
                    child: Image(
                      image: _homeController.usersDetails.isEmpty
                          ? const NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                          : _homeController.usersDetails[0].imageUrl == null
                              ? const NetworkImage(
                                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                              : NetworkImage(
                                  _homeController.usersDetails[0].imageUrl
                                      .toString(),
                                ),
                    ),
                  ),
                ),
              );
            })),
          )
        ],
        leading: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.location_on,
                  size: 40.0, color: Colors.white),
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
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Maruthi Nagar, Madiwala,Ba...",
                  style: TextStyle(
                      fontFamily: '',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
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
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: Colors.green, size: 100),
                )
              : const RestaurantMainPage();
        },
      ),
    );
  }
}
