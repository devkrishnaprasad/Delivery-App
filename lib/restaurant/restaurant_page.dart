import 'package:delivery_app/home/controller/home_controller.dart';
import 'package:delivery_app/restaurant/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantMainPage extends StatefulWidget {
  const RestaurantMainPage({super.key});

  @override
  State<RestaurantMainPage> createState() => _RestaurantMainPageState();
}

class _RestaurantMainPageState extends State<RestaurantMainPage> {
  HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              width: double.infinity,
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
              itemCount: _homeController.restaurantList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return RestaurantsCard(
                  restaurantName:
                      _homeController.restaurantList[index].restaurantName,
                  discription: _homeController
                      .restaurantList[index].restaurantDescription,
                  rating: _homeController.restaurantList[index].restauranRating,
                  imageUrl: _homeController.restaurantList[index].imageUrl,
                  restaurantId:
                      _homeController.restaurantList[index].restaurantId,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
