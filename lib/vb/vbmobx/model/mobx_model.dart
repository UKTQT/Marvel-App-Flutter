// To parse this JSON data, do
//
//     final reqresModel = reqresModelFromMap(jsonString);

//TODO json serializable ------------------

import 'dart:convert';

class ReqresModelMobx {
  ReqresModelMobx({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  factory ReqresModelMobx.fromJson(String str) =>
      ReqresModelMobx.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReqresModelMobx.fromMap(Map<String, dynamic> json) => ReqresModelMobx(
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
