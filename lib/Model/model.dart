// To parse this JSON data, do
//
//     final guddiki = guddikiFromJson(jsonString);

import 'dart:convert';

List<Guddiki> guddikiFromJson(String str) =>
    List<Guddiki>.from(json.decode(str).map((x) => Guddiki.fromJson(x)));

String guddikiToJson(List<Guddiki> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Guddiki {
  Guddiki({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Guddiki.fromJson(Map<String, dynamic> json) => Guddiki(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
