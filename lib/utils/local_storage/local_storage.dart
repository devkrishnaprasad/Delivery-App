import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future write(String name, dynamic value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString(name, value);
  }

  Future<dynamic> read(String name) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var stored_data = storage.getString(name);
    return stored_data;
  }
}
