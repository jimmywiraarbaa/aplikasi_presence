// To parse this JSON data, do
//
//     final savePresenceResponModel = savePresenceResponModelFromJson(jsonString);

import 'dart:convert';

SavePresenceResponModel savePresenceResponModelFromJson(String str) =>
    SavePresenceResponModel.fromJson(json.decode(str));

String savePresenceResponModelToJson(SavePresenceResponModel data) =>
    json.encode(data.toJson());

class SavePresenceResponModel {
  bool success;
  String message;
  Data data;

  SavePresenceResponModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SavePresenceResponModel.fromJson(Map<String, dynamic> json) =>
      SavePresenceResponModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int userId;
  String latitude;
  String longitude;
  DateTime tanggal;
  String masuk;
  dynamic pulang;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.tanggal,
    required this.masuk,
    required this.pulang,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        tanggal: DateTime.parse(json["tanggal"]),
        masuk: json["masuk"],
        pulang: json["pulang"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "latitude": latitude,
        "longitude": longitude,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "masuk": masuk,
        "pulang": pulang,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
