import 'dart:convert';

class Category {
  int? id;
  String? name;
  String? nameEn;
  String? nameAr;
  String? image;

  Category({this.id, this.name, this.image, this.nameEn, this.nameAr});

  @override
  String toString() => 'Category(id: $id, name: $name, nameEn: $nameEn, nameAr: $nameAr, image: $image)';

  factory Category.fromMap(Map<String, dynamic> data) => Category(
        id: data['Id'] as int?,
        name: data['Name'] as String?,
        nameEn: data['NameEn'] as String?,
        nameAr: data['NameAr'] as String?,
        image: data['Image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Id': id,
        'NameEr': nameEn,
        'NameAr': nameAr,
        'Name': name,
        'Image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Category].
  factory Category.fromJson(String data) {
    return Category.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Category] to a JSON string.
  String toJson() => json.encode(toMap());

  Category copyWith({
    int? id,
    String? name,
    String? nameEn,
    String? nameAr,
    String? image,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      image: image ?? this.image,
    );
  }
}
