import 'dart:convert';

UsersData UsersDataFromJson(String str) => UsersData.fromJson(json.decode(str));

String UsersDataToJson(UsersData data) => json.encode(data.toJson());

class UsersData {
  Response response;

  UsersData({
    required this.response,
  });

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
      };
}

class Response {
  String msg;
  List<UsersRecord> records;
  bool status;

  Response({
    required this.msg,
    required this.records,
    required this.status,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        msg: json["msg"],
        records: List<UsersRecord>.from(
            json["records"].map((x) => UsersRecord.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "status": status,
      };
}

class UsersRecord {
  String email;
  String fullName;
  String imageUrl;
  String phoneNumber;
  String userId;

  UsersRecord({
    required this.email,
    required this.fullName,
    required this.imageUrl,
    required this.phoneNumber,
    required this.userId,
  });

  factory UsersRecord.fromJson(Map<String, dynamic> json) => UsersRecord(
        email: json["email"],
        fullName: json["full_name"],
        imageUrl: json["image_url"],
        phoneNumber: json["phone_number"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "full_name": fullName,
        "image_url": imageUrl,
        "phone_number": phoneNumber,
        "user_id": userId,
      };
}
