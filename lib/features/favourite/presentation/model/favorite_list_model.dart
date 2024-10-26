import 'dart:convert';

List<FavoriteListModel> favoriteListModelFromJson(String str) =>
    List<FavoriteListModel>.from(
        json.decode(str).map((x) => FavoriteListModel.fromJson(x)));

String favoriteListModelToJson(List<FavoriteListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteListModel {
    int id; //
    String? poster; //
    String? name; // Changed
    String? nameEn; //
    String? nameAr; //
    Venue? venue; //
    String? date; //
    bool isFavourite;

    FavoriteListModel({
        required this.id,
        this.poster,
        this.name,
        this.nameEn,
        this.nameAr,
        this.venue,
        this.date,
        required this.isFavourite,
    });

    factory FavoriteListModel.fromJson(Map<String, dynamic> json) =>
        FavoriteListModel(
            id: json["Id"],
            poster: json["Poster"] as String?,
            name: json["Name"] as String?,
            nameEn: json['NameEn'] as String?,
            nameAr: json['NameAr'] as String?,
            venue: json["Venue"] != null ? Venue.fromJson(json["Venue"]) : null,
            date: json["Date"] as String?,
            isFavourite: json["IsFavourite"],
        );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Poster": poster,
        "Name": name,
        'NameEn': nameEn,
        'NameAr': nameAr,
        "Venue": venue?.toJson(), // Use null-aware operator
        "Date": date,
        "IsFavourite": isFavourite,
    };
}

class Venue {
    int? id;
    String? name;

    Venue({
        this.id,
        this.name,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["Id"] as int?,
        name: json["Name"] as String?,
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
    };
}
