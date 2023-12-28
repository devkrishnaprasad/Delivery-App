import 'package:delivery_app/home/model/all_restaurant_model.dart';
import 'package:delivery_app/home/model/menu_item_model.dart';
import 'package:delivery_app/utils/services/api/api_provider.dart';
import 'package:delivery_app/utils/services/models/user_models.dart';
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
      print("API Response $response");
    } catch (error) {
      print('Error in getAllResturant: $error');
      return [];
    }
    return [];
  }

  Future<List<UsersRecord>> getUserDetails(userId) async {
    // ignore: unused_local_variable
    List<UsersRecord> userDetailsList;
    try {
      var body = {"user_id": userId};
      var response =
          await _apiProvider.apiManager("/get_user_details/filtered", body);
      var usersDetails = response['response']['records'];
      userDetailsList = usersDetails
          .map<UsersRecord>((p) => UsersRecord.fromJson(p))
          .toList();
      if (usersDetails.isNotEmpty) {
        return usersDetails;
      }
    } catch (error) {
      print('Error in getUserDetails: $error');
      return [];
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
