// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:delivery_app/utils/local_storage/local_storage.dart';
import 'package:delivery_app/utils/services/api/api_provider.dart';
import 'package:delivery_app/utils/services/constants.dart';
import 'package:dio/dio.dart';

class UserApiService {
  updateUserDetails(
    filePath,
    fileName,
    fullName,
    email,
    phoneNumber,
    dateOfBirth,
    gender,
    imageUrl,
  ) async {
    LocalStorage _localStorage = LocalStorage();
    var userId = await _localStorage.read('user_id');
    var apiUrl = '/update_user_details';

    var body = {
      'full_name': fullName,
      'email': email,
      'phone_number': phoneNumber,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'user_id': userId,
      'image_url': imageUrl,
    };

    if (filePath != 'default') {
      print("Image Api call done ....");
      var data = FormData.fromMap({
        'file': [await MultipartFile.fromFile(filePath, filename: fileName)],
        ...body,
      });

      var dio = Dio();
      final AppConstansConfiguration _appConstansConfiguration =
          AppConstansConfiguration();
      var response = await dio.post(_appConstansConfiguration.API_URL + apiUrl,
          data: data);

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } else {
      print("Normal Api call done ....");
      ApiProvider apiProvider = ApiProvider();
      var response = await apiProvider.apiManager(apiUrl, body);
      print("Update response : $response");
    }
  }
}
