// To parse this JSON data, do
//
//     final Restaurants = RestaurantsFromJson(jsonString);

import 'dart:convert';

Restaurants RestaurantsFromJson(String str) =>
    Restaurants.fromJson(json.decode(str));

String RestaurantsToJson(Restaurants data) => json.encode(data.toJson());

class Restaurants {
  RestaurantResponse response;

  Restaurants({
    required this.response,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        response: RestaurantResponse.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class RestaurantResponse {
  String msg;
  List<RestaurantRecord> records;
  bool status;

  RestaurantResponse({
    required this.msg,
    required this.records,
    required this.status,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantResponse(
        msg: json["msg"],
        records: List<RestaurantRecord>.from(
            json["records"].map((x) => RestaurantRecord.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "status": status,
      };
}

class RestaurantRecord {
  String imageUrl;
  String restauranContactNumber;
  String restauranRating;
  String restaurantDescription;
  String restaurantId;
  String restaurantName;

  RestaurantRecord({
    required this.imageUrl,
    required this.restauranContactNumber,
    required this.restauranRating,
    required this.restaurantDescription,
    required this.restaurantId,
    required this.restaurantName,
  });

  factory RestaurantRecord.fromJson(Map<String, dynamic> json) =>
      RestaurantRecord(
        imageUrl: json["image_url"],
        restauranContactNumber: json["restauran_contact_number"],
        restauranRating: json["restauran_rating"],
        restaurantDescription: json["restaurant_description"],
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "restauran_contact_number": restauranContactNumber,
        "restauran_rating": restauranRating,
        "restaurant_description": restaurantDescription,
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
      };
}
