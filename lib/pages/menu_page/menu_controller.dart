import 'package:delivery_app/utils/local_storage/local_storage.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController {
  RxInt cartItemCount = 0.obs;
  RxInt carTotalPrice = 0.obs;
  RxList itemId = [].obs;
  RxString restaurantId = ''.obs;

  processBilling() async {
    LocalStorage _localStorage = LocalStorage();
    var user_id = await _localStorage.read('user_id');
    var payload = {
      "restaurant_id": restaurantId.value,
      "user_id": user_id,
      "item_id": itemId,
      "total_price": carTotalPrice.value
    };
    print("The Payload ${payload}");
  }

  renderBillingView() async {}
}
