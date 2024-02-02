class Venue {
  int? id;
  String? name;
  String? photo;
  String? instagram;
  String? facebook;
  String? websiteUrl;
  String? other;
  String? address;
  String? mapLink;

  Venue({
    this.id,
    this.name,
    this.photo,
    this.instagram,
    this.facebook,
    this.websiteUrl,
    this.other,
    this.address,
    this.mapLink,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json['Id'] as int?,
        name: json['Name'] as String?,
        photo: json['Photo'] as String?,
        instagram: json['Instagram'] as String?,
        facebook: json['Facebook'] as String?,
        websiteUrl: json['WebsiteURL'] as String?,
        other: json['Other'] as String?,
        address: json['Address'] as String?,
        mapLink: json['MapLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Photo': photo,
        'Instagram': instagram,
        'Facebook': facebook,
        'WebsiteURL': websiteUrl,
        'Other': other,
        'Address': address,
        'MapLink': mapLink,
      };
}
