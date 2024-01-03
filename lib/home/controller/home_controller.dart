import 'package:delivery_app/home/controller/api/restaurant_api.dart';
import 'package:delivery_app/home/model/all_restaurant_model.dart';
import 'package:delivery_app/home/model/menu_item_model.dart';
import 'package:delivery_app/user_profile/model/user_models.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ResturantApiService _resturantApiService = Get.put(ResturantApiService());
  RxBool isloading = false.obs;
  var restaurantList = List<RestaurantRecord>.empty().obs;
  var usersDetails = List<UserRecord>.empty().obs;
  var menuListrecords = List<MenuListRecord>.empty().obs;

  getAllRestaurantDetails() async {
    try {
      isloading.value = true;
      var restaurantDetails = await _resturantApiService.getAllResturant();
      restaurantList.assignAll(restaurantDetails);
    } catch (error) {
      print('Error during API call: $error');
    } finally {
      isloading.value = false;
    }
  }

  getUserDetails(userId) async {
    try {
      isloading.value = true;
      var userDetails = await _resturantApiService.getUserDetails(userId);
      usersDetails.assignAll(userDetails);
    } catch (error) {
      print('Error during API call: $error');
    } finally {
      isloading.value = false;
    }
  }

  getMenuItes(resturantId) async {
    try {
      isloading.value = true;
      var menuDetails = await _resturantApiService.getMenuItems(resturantId);
      menuListrecords.assignAll(menuDetails);
    } catch (error) {
      print('Error during API call: $error');
    } finally {
      isloading.value = false;
    }
  }
}
