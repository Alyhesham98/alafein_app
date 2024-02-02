import 'dart:convert';

class Repeat {
  int? id;
  int? number;

  Repeat({this.id, this.number});

  @override
  String toString() => 'Repeat(id: $id, number: $number)';

  factory Repeat.fromMap(Map<String, dynamic> data) => Repeat(
        id: data['Id'] as int?,
        number: data['Number'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'Id': id,
        'Number': number,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Repeat].
  factory Repeat.fromJson(String data) {
    return Repeat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Repeat] to a JSON string.
  String toJson() => json.encode(toMap());

  Repeat copyWith({
    int? id,
    int? number,
  }) {
    return Repeat(
      id: id ?? this.id,
      number: number ?? this.number,
    );
  }
}
