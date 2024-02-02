import 'dart:convert';

import 'branch.dart';

class Venue {
  int? id;
  String? name;
  List<Branch>? branch;

  Venue({this.id, this.name, this.branch});

  @override
  String toString() => 'Venue(id: $id, name: $name, branch: $branch)';

  factory Venue.fromMap(Map<String, dynamic> data) => Venue(
        id: data['Id'] as int?,
        name: data['Name'] as String?,
        branch: (data['Branch'] as List<dynamic>?)
            ?.map((e) => Branch.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'Id': id,
        'Name': name,
        'Branch': branch?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Venue].
  factory Venue.fromJson(String data) {
    return Venue.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Venue] to a JSON string.
  String toJson() => json.encode(toMap());

  Venue copyWith({
    int? id,
    String? name,
    List<Branch>? branch,
  }) {
    return Venue(
      id: id ?? this.id,
      name: name ?? this.name,
      branch: branch ?? this.branch,
    );
  }
}
