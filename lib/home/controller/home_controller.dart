import 'package:delivery_app/home/controller/api/restaurant_api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ResturantApiService _resturantApiService = Get.put(ResturantApiService());
  RxBool isloading = false.obs;

  getAllRestaurantDetails() async {
    try {
      isloading.value = true;
      await _resturantApiService.getAllResturant();
    } catch (error) {
      print('Error during API call: $error');
    } finally {
      isloading.value = false;
    }
  }

  getUserDetails(userId) async {
    try {
      isloading.value = true;
      await _resturantApiService.getUserDetails(userId);
    } catch (error) {
      print('Error during API call: $error');
    } finally {
      isloading.value = false;
    }
  }
}
