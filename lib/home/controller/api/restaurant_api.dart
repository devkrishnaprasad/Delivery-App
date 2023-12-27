import 'package:delivery_app/utils/services/api/api_provider.dart';
import 'package:get/get.dart';

class ResturantApiService extends GetxController {
  ApiProvider _apiProvider = ApiProvider();

  getAllResturant() async {
    print("getAllResturant Function called.....");
    try {
      var response =
          await _apiProvider.apiManager("/get_restaurant_details/all", "");
      print("API Response $response");
    } catch (error) {
      print('Error in getAllResturant: $error');
    }
  }

  getUserDetails(userId) async {
    print("getUserDetails Function called.....");
    try {
      var body = {"user_id": userId};
      var response =
          await _apiProvider.apiManager("/get_user_details/filtered", body);
      print("API Response $response");
    } catch (error) {
      print('Error in getAllResturant: $error');
    }
  }
}
