class RegistrationVenueModel {
  String? instagram;
  String? facebook;
  String? websiteURL;
  String? other;
  String? phoneNumber;
  String? venueName;
  String? venueDescription;
  int? categoryId;
  List<String>? photos;
  List<int>? venueFacilities;
  List<Branches>? branches;

  RegistrationVenueModel(
      {this.instagram,
      this.facebook,
      this.websiteURL,
      this.other,
      this.phoneNumber,
      this.venueName,
      this.venueDescription,
      this.categoryId,
      this.photos,
      this.venueFacilities,
      this.branches});

  RegistrationVenueModel.fromJson(Map<String, dynamic> json) {
    instagram = json['instagram'];
    facebook = json['facebook'];
    websiteURL = json['websiteURL'];
    other = json['other'];
    phoneNumber = json['phoneNumber'];
    venueName = json['venueName'];
    venueDescription = json['venueDescription'];
    categoryId = json['categoryId'];
    photos = json['photos'].cast<String>();
    venueFacilities = json['venueFacilities'].cast<int>();
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(Branches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    data['websiteURL'] = websiteURL;
    data['other'] = other;
    data['phoneNumber'] = phoneNumber;
    data['venueName'] = venueName;
    data['venueDescription'] = venueDescription;
    data['categoryId'] = categoryId;
    data['photos'] = photos;
    data['venueFacilities'] = venueFacilities;
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branches {
  String? address;
  String? mapLink;
  String? name;
  List<int>? branchFacilities;
  List<WorkDays>? workDays;

  Branches({
    this.address,
    this.mapLink,
    this.workDays,
    this.name,
  });

  Branches.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
    mapLink = json['mapLink'];
    if (json['workDays'] != null) {
      workDays = <WorkDays>[];
      json['workDays'].forEach((v) {
        workDays!.add(WorkDays.fromJson(v));
      });
    }
    if (json['branchFacilities'] != null) {
      branchFacilities = <int>[];
      json['branchFacilities'].forEach((v) {
        branchFacilities!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['mapLink'] = mapLink;
    data['name'] = name;
    if (workDays != null) {
      data['workDays'] = workDays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkDays {
  int? id;
  String? from;
  String? to;

  WorkDays({this.id, this.from, this.to});

  WorkDays.fromJson(Map<String, dynamic> json) {
    id = json['day'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = id;
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}
