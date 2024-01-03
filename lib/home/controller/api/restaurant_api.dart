import 'package:delivery_app/home/model/all_restaurant_model.dart';
import 'package:delivery_app/home/model/menu_item_model.dart';
import 'package:delivery_app/utils/services/api/api_provider.dart';
import 'package:delivery_app/user_profile/model/user_models.dart';
import 'package:get/get.dart';

class ResturantApiService extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<RestaurantRecord>> getAllResturant() async {
    List<RestaurantRecord> allRestaurantList;
    try {
      var response =
          await _apiProvider.apiManager("/get_restaurant_details/all", "");

      var restaurantList = response['response']['records'];
      allRestaurantList = restaurantList
          .map<RestaurantRecord>((p) => RestaurantRecord.fromJson(p))
          .toList();
      if (restaurantList.isNotEmpty) {
        return allRestaurantList;
      }
    } catch (error) {
      print('Error in getAllResturant: $error');
      return [];
    }
    return [];
  }

  Future<List<UserRecord>> getUserDetails(userId) async {
    List<UserRecord> userDetailsList;
    try {
      var body = {"user_id": userId};
      var response =
          await _apiProvider.apiManager("/get_user_details/filtered", body);
      var usersDetails = response['response']['records'];
      userDetailsList =
          usersDetails.map<UserRecord>((p) => UserRecord.fromJson(p)).toList();
      if (userDetailsList.isNotEmpty) {
        return userDetailsList;
      }
    } catch (error) {
      print('Error in getUserDetails: $error');
      return []; // or throw an exception based on your error handling strategy
    }
    return [];
  }

  Future<List<MenuListRecord>> getMenuItems(restaurantId) async {
    print("getMenuItems function running.....");
    List<MenuListRecord> menuListRecord;
    try {
      var body = {"restaurant_id": restaurantId};
      var response = await _apiProvider.apiManager(
          "/get_restaurant_menu_list/flitered", body);

      var restaurantList = response['response']['records'];
      menuListRecord = restaurantList
          .map<MenuListRecord>((p) => MenuListRecord.fromJson(p))
          .toList();
      if (restaurantList.isNotEmpty) {
        return menuListRecord;
      }
      print("API Response $response");
    } catch (error) {
      print('Error in getMenuItems: $error');
      return [];
    }
    return [];
  }
}
