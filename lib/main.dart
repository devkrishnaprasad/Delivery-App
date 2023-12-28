import 'package:delivery_app/home/controller/home_controller.dart';
import 'package:delivery_app/home/home.dart';
import 'package:delivery_app/splash_screen/screen_1.dart';
import 'package:delivery_app/splash_screen/screen_2.dart';
import 'package:delivery_app/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
  await initialSetup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(360, 640),
    );
  }
}

initialSetup() async {
  print("initialSetup Called.....");
  HomeController _homeController = Get.put(HomeController());
  LocalStorage _localStorage = LocalStorage();
  await _localStorage.write('user_id', '23a1bcc0-e849-46d1-b67b-ac076e7ef6cb');
  var userId = await _localStorage.read('user_id');
  // await _homeController.getUserDetails(userId);
  await _homeController.getAllRestaurantDetails();
}
