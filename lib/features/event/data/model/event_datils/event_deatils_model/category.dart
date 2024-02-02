class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['Id'] as int?,
        name: json['Name'] as String?,
        image: json['Image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Image': image,
      };
}
