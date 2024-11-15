class FilterModel {
  int id;
  String? poster;
  String? name;
  String? nameEn;
  String? nameAr;
  Venue? venue;
  String? date;
  bool? isFavourite;

  FilterModel({
    required this.id,
    this.poster,
    this.name,
    this.nameEn,
    this.nameAr,
    this.venue,
    this.date,
    this.isFavourite,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        id: json["Id"] ?? 0,
        poster: json["Poster"] ?? "",
        name: json["Name"] ?? "",
        nameEn: json["NameEn"] ?? "",
        nameAr: json["NameAr"] ?? "",
        venue: json["Venue"] != null ? Venue.fromJson(json["Venue"]) : null,
        date: json["Date"] ?? "",
        isFavourite: json["IsFavourite"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Poster": poster,
        "Name": name,
        "NameEn": nameEn,
        "NameAr": nameAr,
        "Venue": venue?.toJson(),
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
        id: json["Id"] ?? 0,
        name: json["Name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
      };
}
