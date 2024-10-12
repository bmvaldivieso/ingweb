// To parse this JSON data, do
//
//     final noticiasModel = noticiasModelFromJson(jsonString);

import 'dart:convert';

NoticiasModel noticiasModelFromJson(String str) =>
    NoticiasModel.fromJson(json.decode(str));

String noticiasModelToJson(NoticiasModel data) => json.encode(data.toJson());

class NoticiasModel {
  int status;
  int page;
  int total;
  List<Datum> data;

  NoticiasModel({
    required this.status,
    required this.page,
    required this.total,
    required this.data,
  });

  factory NoticiasModel.fromJson(Map<String, dynamic> json) => NoticiasModel(
        status: json["status"],
        page: json["page"],
        total: json["total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "page": page,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String title;
  String description;
  Image image;
  DateTime date;

  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: Image.fromJson(json["image"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image.toJson(),
        "date": date.toIso8601String(),
      };
}

class Image {
  String url;
  String thumb;
  String medium;

  Image({
    required this.url,
    required this.thumb,
    required this.medium,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        thumb: json["thumb"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "thumb": thumb,
        "medium": medium,
      };
}
