// To parse this JSON data, do
//
//     final menuItem = menuItemFromJson(jsonString);

import 'dart:convert';

MenuItem menuItemFromJson(String str) => MenuItem.fromJson(json.decode(str));

String menuItemToJson(MenuItem data) => json.encode(data.toJson());

class MenuItem {
  Response response;

  MenuItem({
    required this.response,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  String msg;
  List<MenuListRecord> records;
  bool status;

  Response({
    required this.msg,
    required this.records,
    required this.status,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        msg: json["msg"],
        records: List<MenuListRecord>.from(
            json["records"].map((x) => MenuListRecord.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "status": status,
      };
}

class MenuListRecord {
  String imageUrl;
  String itemDescription;
  String itemId;
  String itemName;
  String itemPrice;
  String itemRating;
  String restaurantId;
  bool veg;

  MenuListRecord({
    required this.imageUrl,
    required this.itemDescription,
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.itemRating,
    required this.restaurantId,
    required this.veg,
  });

  factory MenuListRecord.fromJson(Map<String, dynamic> json) => MenuListRecord(
        imageUrl: json["image_url"],
        itemDescription: json["item_description"],
        itemId: json["item_id"],
        itemName: json["item_name"],
        itemPrice: json["item_price"],
        itemRating: json["item_rating"],
        restaurantId: json["restaurant_id"],
        veg: json["veg"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "item_description": itemDescription,
        "item_id": itemId,
        "item_name": itemName,
        "item_price": itemPrice,
        "item_rating": itemRating,
        "restaurant_id": restaurantId,
        "veg": veg,
      };
}
