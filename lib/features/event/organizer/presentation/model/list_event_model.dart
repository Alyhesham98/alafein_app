// To parse this JSON data, do
//
//     final listEventModel = listEventModelFromJson(jsonString);

import 'dart:convert';

List<ListEventModel> listEventModelFromJson(String str) => List<ListEventModel>.from(json.decode(str).map((x) => ListEventModel.fromJson(x)));

String listEventModelToJson(List<ListEventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListEventModel {
    int? id;
    String? poster;
    // String? name;
    String? nameEn;
    String? nameAr;
    Venue? venue;
    String? date;
    bool? isFavourite;

    ListEventModel({
        required this.id,
        required this.poster,
        // required this.name,
        required this.nameEn,
        required this.nameAr,
        required this.venue,
        required this.date,
        required this.isFavourite,
    });

    factory ListEventModel.fromJson(Map<String, dynamic> json) => ListEventModel(
        id: json["Id"],
        poster: json["Poster"],
        // name: json["Name"],
        nameEn: json["NameEn"],
        nameAr: json["NameAr"],
        venue: Venue.fromJson(json["Venue"]),
        date: json["Date"],
        isFavourite: json["IsFavourite"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Poster": poster,
        // "Name": name,
        "NameEn": nameEn,
        "NameAr": nameAr,
        "Venue": venue!.toJson(),
        "Date": date,
        "IsFavourite": isFavourite,
    };
}

class Venue {
    int id;
    String name;

    Venue({
        required this.id,
        required this.name,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["Id"],
        name: json["Name"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
    };
}
