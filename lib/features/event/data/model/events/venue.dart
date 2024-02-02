class Venue {
  int? id;
  String? name;

  Venue({this.id, this.name});

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json['Id'] as int?,
        name: json['Name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
      };
}
