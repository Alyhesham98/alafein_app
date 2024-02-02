class LookupModel {
  List<Roles>? roles;
  List<Category>? category;
  List<Facility>? facility;

  LookupModel({this.roles, this.category, this.facility});

  LookupModel.fromJson(Map<String, dynamic> json) {
    if (json['Roles'] != null) {
      roles = <Roles>[];
      json['Roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    if (json['Category'] != null) {
      category = <Category>[];
      json['Category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    if (json['Facility'] != null) {
      facility = <Facility>[];
      json['Facility'].forEach((v) {
        facility!.add(Facility.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (roles != null) {
      data['Roles'] = roles!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['Category'] = category!.map((v) => v.toJson()).toList();
    }
    if (facility != null) {
      data['Facility'] = facility!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Roles {
  String? id;
  String? name;

  Roles({this.id, this.name});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}

class Facility {
  int? id;
  String? imagePath;
  String? imageName;

  Facility({this.id, this.imagePath, this.imageName});

  Facility.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    imagePath = json['ImagePath'];
    imageName = json['ImageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['ImagePath'] = imagePath;
    data['ImageName'] = imageName;
    return data;
  }
}
