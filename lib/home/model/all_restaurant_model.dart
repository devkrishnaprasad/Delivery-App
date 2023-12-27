import 'dart:convert';

AllResturantRecords allResturantRecordsFromJson(String str) =>
    AllResturantRecords.fromJson(json.decode(str));

String allResturantRecordsToJson(AllResturantRecords data) =>
    json.encode(data.toJson());

class AllResturantRecords {
  Response response;

  AllResturantRecords({
    required this.response,
  });

  factory AllResturantRecords.fromJson(Map<String, dynamic> json) =>
      AllResturantRecords(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  String msg;
  List<Record> records;
  bool status;

  Response({
    required this.msg,
    required this.records,
    required this.status,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        msg: json["msg"],
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "status": status,
      };
}

class Record {
  String base64Data;
  String imageName;
  String restauranContactNumber;
  String restauranRating;
  String restaurantDescription;
  String restaurantId;
  String restaurantName;

  Record({
    required this.base64Data,
    required this.imageName,
    required this.restauranContactNumber,
    required this.restauranRating,
    required this.restaurantDescription,
    required this.restaurantId,
    required this.restaurantName,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        base64Data: json["base64_data"],
        imageName: json["image_name"],
        restauranContactNumber: json["restauran_contact_number"],
        restauranRating: json["restauran_rating"],
        restaurantDescription: json["restaurant_description"],
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
      );

  Map<String, dynamic> toJson() => {
        "base64_data": base64Data,
        "image_name": imageName,
        "restauran_contact_number": restauranContactNumber,
        "restauran_rating": restauranRating,
        "restaurant_description": restaurantDescription,
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
      };
}
