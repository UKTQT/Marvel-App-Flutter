// To parse this JSON data, do
//
//     final reqresModel = reqresModelFromMap(jsonString);

import 'dart:convert';

class ReqresModel {
  ReqresModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  factory ReqresModel.fromJson(String str) =>
      ReqresModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReqresModel.fromMap(Map<String, dynamic> json) => ReqresModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
