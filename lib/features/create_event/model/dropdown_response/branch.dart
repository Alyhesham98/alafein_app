import 'dart:convert';

class Branch {
  int? id;
  String? name;

  Branch({this.id, this.name});

  @override
  String toString() => 'Branch(id: $id, name: $name)';

  factory Branch.fromMap(Map<String, dynamic> data) => Branch(
        id: data['Id'] as int?,
        name: data['Name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Id': id,
        'Name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Branch].
  factory Branch.fromJson(String data) {
    return Branch.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Branch] to a JSON string.
  String toJson() => json.encode(toMap());

  Branch copyWith({
    int? id,
    String? name,
  }) {
    return Branch(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
