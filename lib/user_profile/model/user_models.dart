// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  Response response;

  UserData({
    required this.response,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  String msg;
  List<UserRecord> records;
  bool status;

  Response({
    required this.msg,
    required this.records,
    required this.status,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        msg: json["msg"],
        records: List<UserRecord>.from(
            json["records"].map((x) => UserRecord.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "status": status,
      };
}

class UserRecord {
  String dateOfBirth;
  String email;
  String fullName;
  String gender;
  String? imageUrl; // Make imageUrl nullable by adding '?'
  String phoneNumber;
  String userId;

  UserRecord({
    required this.dateOfBirth,
    required this.email,
    required this.fullName,
    required this.gender,
    this.imageUrl, // Update imageUrl to be nullable
    required this.phoneNumber,
    required this.userId,
  });

  factory UserRecord.fromJson(Map<String, dynamic> json) => UserRecord(
        dateOfBirth: json["date_of_birth"],
        email: json["email"],
        fullName: json["full_name"],
        gender: json["gender"],
        imageUrl: json["image_url"],
        phoneNumber: json["phone_number"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "date_of_birth": dateOfBirth,
        "email": email,
        "full_name": fullName,
        "gender": gender,
        "image_url": imageUrl, // Update imageUrl to be nullable
        "phone_number": phoneNumber,
        "user_id": userId,
      };
}
