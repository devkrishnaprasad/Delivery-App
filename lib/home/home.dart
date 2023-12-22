import 'package:delivery_app/restaurant/restaurant_card.dart';
import 'package:delivery_app/user_profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedPageIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.h, 0.w, 15.h, 0.w),
              child: InkWell(
                onTap: () {
                  Get.to(UserProfile());
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
        // bottomNavigationBar: NavigationBar(
        //   selectedIndex: selectedPageIndex,
        //   onDestinationSelected: (int index) {
        //     setState(() {
        //       selectedPageIndex = index;
        //     });
        //   },
        //   destinations: const <NavigationDestination>[
        //     NavigationDestination(
        //       selectedIcon: Icon(Icons.person),
        //       icon: Icon(Icons.person_outline),
        //       label: 'Learn',
        //     ),
        //     NavigationDestination(
        //       selectedIcon: Icon(Icons.engineering),
        //       icon: Icon(Icons.engineering_outlined),
        //       label: 'Relearn',
        //     ),
        //     NavigationDestination(
        //       selectedIcon: Icon(Icons.bookmark),
        //       icon: Icon(Icons.bookmark_border),
        //       label: 'Unlearn',
        //     ),
        //   ],
        // ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(width: 0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'Search ...',
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.mic,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Container(
                  height: 150,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/banner_img.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const RestaurantsCard();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
