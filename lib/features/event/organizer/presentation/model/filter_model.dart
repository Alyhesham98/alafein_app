// To parse this JSON data, do
//
//     final favoriteListModel = favoriteListModelFromJson(jsonString);

import 'dart:convert';

List<FilterModel> favoriteListModelFromJson(String str) => List<FilterModel>.from(json.decode(str).map((x) => FilterModel.fromJson(x)));

String favoriteListModelToJson(List<FilterModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilterModel {
    int id;
    String poster;
    String name;
    Venue venue;
    String date;
    bool isFavourite;

    FilterModel({
        required this.id,
        required this.poster,
        required this.name,
        required this.venue,
        required this.date,
        required this.isFavourite,
    });

    factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        id: json["Id"],
        poster: json["Poster"],
        name: json["Name"],
        venue: Venue.fromJson(json["Venue"]),
        date: json["Date"],
        isFavourite: json["IsFavourite"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Poster": poster,
        "Name": name,
        "Venue": venue.toJson(),
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
