class RegistrationOrganizerModel {
  String? mapLink;
  String? address;
  String? instagram;
  String? facebook;
  String? websiteURL;
  String? other;
  String? description;
  int? categoryId;

  RegistrationOrganizerModel({
    this.mapLink,
    this.address,
    this.instagram,
    this.facebook,
    this.websiteURL,
    this.other,
    this.description,
    this.categoryId,
  });

  RegistrationOrganizerModel.fromJson(Map<String, dynamic> json) {
    mapLink = json['mapLink'];
    address = json['address'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    websiteURL = json['websiteURL'];
    other = json['other'];
    description = json['description'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mapLink'] = mapLink;
    data['address'] = address;
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    data['websiteURL'] = websiteURL;
    data['other'] = other;
    data['description'] = description;
    data['categoryId'] = categoryId;
    return data;
  }
}
