import 'package:flutter/material.dart';

class SplashScreenSlideOne extends StatefulWidget {
  const SplashScreenSlideOne({super.key});

  @override
  State<SplashScreenSlideOne> createState() => _SplashScreenSlideOneState();
}

class _SplashScreenSlideOneState extends State<SplashScreenSlideOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/banner_img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
