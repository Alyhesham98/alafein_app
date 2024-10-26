import 'dart:convert';

class Today {
  int? id;
  String? name;
  String? nameEn;
  String? nameAr;
  String? poster;
  String? catPoster;
  String? date;

  Today(
      {this.id,
      this.name,
      this.poster,
      this.catPoster,
      this.date,
      this.nameEn,
      this.nameAr});

  @override
  String toString() {
    return 'Today(id: $id, name: $name, nameEn: $nameEn, nameAr: $nameAr, poster: $poster, catPoster: $catPoster, date: $date)';
  }

  factory Today.fromMap(Map<String, dynamic> data) => Today(
        id: data['Id'] as int?,
        name: data['Name'] as String?,
        nameEn: data['NameEn'] as String?,
        nameAr: data['NameAr'] as String?,
        poster: data['Poster'] as String?,
        catPoster: data['CategoryPoster'] as String?,
        date: data['Date'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Id': id,
        'Name': name,
        'NameEr': nameEn,
        'NameAr': nameAr,
        'Poster': poster,
        'CategoryPoster': catPoster,
        'Date': date,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Today].
  factory Today.fromJson(String data) {
    return Today.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Today] to a JSON string.
  String toJson() => json.encode(toMap());

  Today copyWith({
    int? id,
    String? name,
    String? nameEn,
    String? nameAr,
    String? poster,
    String? catPoster,
    String? date,
  }) {
    return Today(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      poster: poster ?? this.poster,
      catPoster: catPoster ?? this.catPoster,
      date: date ?? this.date,
    );
  }
}
