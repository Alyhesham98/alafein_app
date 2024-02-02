class Organizer {
  String? id;
  String? name;

  Organizer({this.id, this.name});

  factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
        id: json['Id'] as String?,
        name: json['Name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
      };
}
