import 'dart:convert';

class Attendance {
  int? id;
  String? name;

  Attendance({this.id, this.name});

  @override
  String toString() => 'Attendance(id: $id, name: $name)';

  factory Attendance.fromMap(Map<String, dynamic> data) => Attendance(
        id: data['Id'] as int?,
        name: data['Name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Id': id,
        'Name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Attendance].
  factory Attendance.fromJson(String data) {
    return Attendance.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Attendance] to a JSON string.
  String toJson() => json.encode(toMap());

  Attendance copyWith({
    int? id,
    String? name,
  }) {
    return Attendance(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
