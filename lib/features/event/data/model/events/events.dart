import 'venue.dart';

class Events {
  int? id;
  String? poster;
  String? name;
  Venue? venue;
  String? date;

  Events({this.id, this.poster, this.name, this.venue, this.date});

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        id: json['Id'] as int?,
        poster: json['Poster'] as String?,
        name: json['Name'] as String?,
        venue: json['Venue'] == null
            ? null
            : Venue.fromJson(json['Venue'] as Map<String, dynamic>),
        date: json['Date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Poster': poster,
        'Name': name,
        'Venue': venue?.toJson(),
        'Date': date,
      };
}
