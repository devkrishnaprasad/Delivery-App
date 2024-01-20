import 'package:delivery_app/pages/home/controller/home_controller.dart';
import 'package:delivery_app/pages/onboarding_screens/splashing_screen.dart';
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

        home: const SplashScreen(),
        // home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(360, 640),
    );
  }
}

initialSetup() async {
  HomeController homeController = Get.put(HomeController());
  LocalStorage localStorage = LocalStorage();
  await localStorage.write('user_id', '3ec4e406-08f8-4995-a662-9e7aa412c961');
  var userId = await localStorage.read('user_id');
  if (userId != '') await homeController.getUserDetails(userId);
  await homeController.getAllRestaurantDetails();
}
