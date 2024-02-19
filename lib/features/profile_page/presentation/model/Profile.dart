/// Id : "string"
/// FirstName : "string"
/// LastName : "string"
/// Email : "string"
/// Photo : "string"
/// Phone : "string"
/// Venue : {"Id":0,"Instagram":"string","Facebook":"string","WebsiteURL":"string","Other":"string","PhoneNumber":"string","VenueName":"string","VenueImage":"string","VenueDescription":"string","Category":{"Id":0,"Name":"string","Image":"string"},"Schedule":{"Id":0,"Name":"string","Poster":"string","Date":["string"],"CategoryPoster":"string"},"Photos":["string"],"Facilities":[{"Id":0,"ImagePath":"string","ImageName":"string"}],"Branches":[{"Id":0,"Name":"string","Address":"string","MapLink":"string","WorkDay":[{"Id":0,"Day":{"Id":0,"Name":"string"},"From":"string","To":"string"}]}]}
/// Organizer : {"Id":0,"MapLink":"string","Address":"string","Instagram":"string","Facebook":"string","WebsiteURL":"string","Other":"string","Description":"string","Category":{"Id":0,"Name":"string","Image":"string"}}

class Profile {
  Profile({
      String? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? photo, 
      String? phone, 
      Venue? venue, 
      Organizer? organizer,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _photo = photo;
    _phone = phone;
    _venue = venue;
    _organizer = organizer;
}

  Profile.fromJson(dynamic json) {
    _id = json['Id'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _email = json['Email'];
    _photo = json['Photo'];
    _phone = json['Phone'];
    _venue = json['Venue'] != null ? Venue.fromJson(json['Venue']) : null;
    _organizer = json['Organizer'] != null ? Organizer.fromJson(json['Organizer']) : null;
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _photo;
  String? _phone;
  Venue? _venue;
  Organizer? _organizer;
Profile copyWith({  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? photo,
  String? phone,
  Venue? venue,
  Organizer? organizer,
}) => Profile(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  photo: photo ?? _photo,
  phone: phone ?? _phone,
  venue: venue ?? _venue,
  organizer: organizer ?? _organizer,
);
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get photo => _photo;
  String? get phone => _phone;
  Venue? get venue => _venue;
  Organizer? get organizer => _organizer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['Email'] = _email;
    map['Photo'] = _photo;
    map['Phone'] = _phone;
    if (_venue != null) {
      map['Venue'] = _venue?.toJson();
    }
    if (_organizer != null) {
      map['Organizer'] = _organizer?.toJson();
    }
    return map;
  }

}

/// Id : 0
/// MapLink : "string"
/// Address : "string"
/// Instagram : "string"
/// Facebook : "string"
/// WebsiteURL : "string"
/// Other : "string"
/// Description : "string"
/// Category : {"Id":0,"Name":"string","Image":"string"}

class Organizer {
  Organizer({
      num? id, 
      String? mapLink, 
      String? address, 
      String? instagram, 
      String? facebook, 
      String? websiteURL, 
      String? other, 
      String? description, 
      Category? category,}){
    _id = id;
    _mapLink = mapLink;
    _address = address;
    _instagram = instagram;
    _facebook = facebook;
    _websiteURL = websiteURL;
    _other = other;
    _description = description;
    _category = category;
}

  Organizer.fromJson(dynamic json) {
    _id = json['Id'];
    _mapLink = json['MapLink'];
    _address = json['Address'];
    _instagram = json['Instagram'];
    _facebook = json['Facebook'];
    _websiteURL = json['WebsiteURL'];
    _other = json['Other'];
    _description = json['Description'];
    _category = json['Category'] != null ? Category.fromJson(json['Category']) : null;
  }
  num? _id;
  String? _mapLink;
  String? _address;
  String? _instagram;
  String? _facebook;
  String? _websiteURL;
  String? _other;
  String? _description;
  Category? _category;
Organizer copyWith({  num? id,
  String? mapLink,
  String? address,
  String? instagram,
  String? facebook,
  String? websiteURL,
  String? other,
  String? description,
  Category? category,
}) => Organizer(  id: id ?? _id,
  mapLink: mapLink ?? _mapLink,
  address: address ?? _address,
  instagram: instagram ?? _instagram,
  facebook: facebook ?? _facebook,
  websiteURL: websiteURL ?? _websiteURL,
  other: other ?? _other,
  description: description ?? _description,
  category: category ?? _category,
);
  num? get id => _id;
  String? get mapLink => _mapLink;
  String? get address => _address;
  String? get instagram => _instagram;
  String? get facebook => _facebook;
  String? get websiteURL => _websiteURL;
  String? get other => _other;
  String? get description => _description;
  Category? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['MapLink'] = _mapLink;
    map['Address'] = _address;
    map['Instagram'] = _instagram;
    map['Facebook'] = _facebook;
    map['WebsiteURL'] = _websiteURL;
    map['Other'] = _other;
    map['Description'] = _description;
    if (_category != null) {
      map['Category'] = _category?.toJson();
    }
    return map;
  }

}

/// Id : 0
/// Name : "string"
/// Image : "string"

class Category {
  Category({
      num? id, 
      String? name, 
      String? image,}){
    _id = id;
    _name = name;
    _image = image;
}

  Category.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
    _image = json['Image'];
  }
  num? _id;
  String? _name;
  String? _image;
Category copyWith({  num? id,
  String? name,
  String? image,
}) => Category(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    map['Image'] = _image;
    return map;
  }

}

/// Id : 0
/// Instagram : "string"
/// Facebook : "string"
/// WebsiteURL : "string"
/// Other : "string"
/// PhoneNumber : "string"
/// VenueName : "string"
/// VenueImage : "string"
/// VenueDescription : "string"
/// Category : {"Id":0,"Name":"string","Image":"string"}
/// Schedule : {"Id":0,"Name":"string","Poster":"string","Date":["string"],"CategoryPoster":"string"}
/// Photos : ["string"]
/// Facilities : [{"Id":0,"ImagePath":"string","ImageName":"string"}]
/// Branches : [{"Id":0,"Name":"string","Address":"string","MapLink":"string","WorkDay":[{"Id":0,"Day":{"Id":0,"Name":"string"},"From":"string","To":"string"}]}]

class Venue {
  Venue({
      num? id, 
      String? instagram, 
      String? facebook, 
      String? websiteURL, 
      String? other, 
      String? phoneNumber, 
      String? venueName, 
      String? venueImage, 
      String? venueDescription, 
      Category? category, 
      Schedule? schedule, 
      List<String>? photos, 
      List<Facilities>? facilities, 
      List<Branches>? branches,}){
    _id = id;
    _instagram = instagram;
    _facebook = facebook;
    _websiteURL = websiteURL;
    _other = other;
    _phoneNumber = phoneNumber;
    _venueName = venueName;
    _venueImage = venueImage;
    _venueDescription = venueDescription;
    _category = category;
    _schedule = schedule;
    _photos = photos;
    _facilities = facilities;
    _branches = branches;
}

  Venue.fromJson(dynamic json) {
    _id = json['Id'];
    _instagram = json['Instagram'];
    _facebook = json['Facebook'];
    _websiteURL = json['WebsiteURL'];
    _other = json['Other'];
    _phoneNumber = json['PhoneNumber'];
    _venueName = json['VenueName'];
    _venueImage = json['VenueImage'];
    _venueDescription = json['VenueDescription'];
    _category = json['Category'] != null ? Category.fromJson(json['Category']) : null;
    _schedule = json['Schedule'] != null ? Schedule.fromJson(json['Schedule']) : null;
    _photos = json['Photos'] != null ? json['Photos'].cast<String>() : [];
    if (json['Facilities'] != null) {
      _facilities = [];
      json['Facilities'].forEach((v) {
        _facilities?.add(Facilities.fromJson(v));
      });
    }
    if (json['Branches'] != null) {
      _branches = [];
      json['Branches'].forEach((v) {
        _branches?.add(Branches.fromJson(v));
      });
    }
  }
  num? _id;
  String? _instagram;
  String? _facebook;
  String? _websiteURL;
  String? _other;
  String? _phoneNumber;
  String? _venueName;
  String? _venueImage;
  String? _venueDescription;
  Category? _category;
  Schedule? _schedule;
  List<String>? _photos;
  List<Facilities>? _facilities;
  List<Branches>? _branches;
Venue copyWith({  num? id,
  String? instagram,
  String? facebook,
  String? websiteURL,
  String? other,
  String? phoneNumber,
  String? venueName,
  String? venueImage,
  String? venueDescription,
  Category? category,
  Schedule? schedule,
  List<String>? photos,
  List<Facilities>? facilities,
  List<Branches>? branches,
}) => Venue(  id: id ?? _id,
  instagram: instagram ?? _instagram,
  facebook: facebook ?? _facebook,
  websiteURL: websiteURL ?? _websiteURL,
  other: other ?? _other,
  phoneNumber: phoneNumber ?? _phoneNumber,
  venueName: venueName ?? _venueName,
  venueImage: venueImage ?? _venueImage,
  venueDescription: venueDescription ?? _venueDescription,
  category: category ?? _category,
  schedule: schedule ?? _schedule,
  photos: photos ?? _photos,
  facilities: facilities ?? _facilities,
  branches: branches ?? _branches,
);
  num? get id => _id;
  String? get instagram => _instagram;
  String? get facebook => _facebook;
  String? get websiteURL => _websiteURL;
  String? get other => _other;
  String? get phoneNumber => _phoneNumber;
  String? get venueName => _venueName;
  String? get venueImage => _venueImage;
  String? get venueDescription => _venueDescription;
  Category? get category => _category;
  Schedule? get schedule => _schedule;
  List<String>? get photos => _photos;
  List<Facilities>? get facilities => _facilities;
  List<Branches>? get branches => _branches;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Instagram'] = _instagram;
    map['Facebook'] = _facebook;
    map['WebsiteURL'] = _websiteURL;
    map['Other'] = _other;
    map['PhoneNumber'] = _phoneNumber;
    map['VenueName'] = _venueName;
    map['VenueImage'] = _venueImage;
    map['VenueDescription'] = _venueDescription;
    if (_category != null) {
      map['Category'] = _category?.toJson();
    }
    if (_schedule != null) {
      map['Schedule'] = _schedule?.toJson();
    }
    map['Photos'] = _photos;
    if (_facilities != null) {
      map['Facilities'] = _facilities?.map((v) => v.toJson()).toList();
    }
    if (_branches != null) {
      map['Branches'] = _branches?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : 0
/// Name : "string"
/// Address : "string"
/// MapLink : "string"
/// WorkDay : [{"Id":0,"Day":{"Id":0,"Name":"string"},"From":"string","To":"string"}]

class Branches {
  Branches({
      num? id, 
      String? name, 
      String? address, 
      String? mapLink, 
      List<WorkDay>? workDay,}){
    _id = id;
    _name = name;
    _address = address;
    _mapLink = mapLink;
    _workDay = workDay;
}

  Branches.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
    _address = json['Address'];
    _mapLink = json['MapLink'];
    if (json['WorkDay'] != null) {
      _workDay = [];
      json['WorkDay'].forEach((v) {
        _workDay?.add(WorkDay.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _address;
  String? _mapLink;
  List<WorkDay>? _workDay;
Branches copyWith({  num? id,
  String? name,
  String? address,
  String? mapLink,
  List<WorkDay>? workDay,
}) => Branches(  id: id ?? _id,
  name: name ?? _name,
  address: address ?? _address,
  mapLink: mapLink ?? _mapLink,
  workDay: workDay ?? _workDay,
);
  num? get id => _id;
  String? get name => _name;
  String? get address => _address;
  String? get mapLink => _mapLink;
  List<WorkDay>? get workDay => _workDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    map['Address'] = _address;
    map['MapLink'] = _mapLink;
    if (_workDay != null) {
      map['WorkDay'] = _workDay?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : 0
/// Day : {"Id":0,"Name":"string"}
/// From : "string"
/// To : "string"

class WorkDay {
  WorkDay({
      num? id, 
      Day? day, 
      String? from, 
      String? to,}){
    _id = id;
    _day = day;
    _from = from;
    _to = to;
}

  WorkDay.fromJson(dynamic json) {
    _id = json['Id'];
    _day = json['Day'] != null ? Day.fromJson(json['Day']) : null;
    _from = json['From'];
    _to = json['To'];
  }
  num? _id;
  Day? _day;
  String? _from;
  String? _to;
WorkDay copyWith({  num? id,
  Day? day,
  String? from,
  String? to,
}) => WorkDay(  id: id ?? _id,
  day: day ?? _day,
  from: from ?? _from,
  to: to ?? _to,
);
  num? get id => _id;
  Day? get day => _day;
  String? get from => _from;
  String? get to => _to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    if (_day != null) {
      map['Day'] = _day?.toJson();
    }
    map['From'] = _from;
    map['To'] = _to;
    return map;
  }

}

/// Id : 0
/// Name : "string"

class Day {
  Day({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Day.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
  }
  num? _id;
  String? _name;
Day copyWith({  num? id,
  String? name,
}) => Day(  id: id ?? _id,
  name: name ?? _name,
);
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    return map;
  }

}

/// Id : 0
/// ImagePath : "string"
/// ImageName : "string"

class Facilities {
  Facilities({
      num? id, 
      String? imagePath, 
      String? imageName,}){
    _id = id;
    _imagePath = imagePath;
    _imageName = imageName;
}

  Facilities.fromJson(dynamic json) {
    _id = json['Id'];
    _imagePath = json['ImagePath'];
    _imageName = json['ImageName'];
  }
  num? _id;
  String? _imagePath;
  String? _imageName;
Facilities copyWith({  num? id,
  String? imagePath,
  String? imageName,
}) => Facilities(  id: id ?? _id,
  imagePath: imagePath ?? _imagePath,
  imageName: imageName ?? _imageName,
);
  num? get id => _id;
  String? get imagePath => _imagePath;
  String? get imageName => _imageName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['ImagePath'] = _imagePath;
    map['ImageName'] = _imageName;
    return map;
  }

}

/// Id : 0
/// Name : "string"
/// Poster : "string"
/// Date : ["string"]
/// CategoryPoster : "string"

class Schedule {
  Schedule({
      num? id, 
      String? name, 
      String? poster, 
      List<String>? date, 
      String? categoryPoster,}){
    _id = id;
    _name = name;
    _poster = poster;
    _date = date;
    _categoryPoster = categoryPoster;
}

  Schedule.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
    _poster = json['Poster'];
    _date = json['Date'] != null ? json['Date'].cast<String>() : [];
    _categoryPoster = json['CategoryPoster'];
  }
  num? _id;
  String? _name;
  String? _poster;
  List<String>? _date;
  String? _categoryPoster;
Schedule copyWith({  num? id,
  String? name,
  String? poster,
  List<String>? date,
  String? categoryPoster,
}) => Schedule(  id: id ?? _id,
  name: name ?? _name,
  poster: poster ?? _poster,
  date: date ?? _date,
  categoryPoster: categoryPoster ?? _categoryPoster,
);
  num? get id => _id;
  String? get name => _name;
  String? get poster => _poster;
  List<String>? get date => _date;
  String? get categoryPoster => _categoryPoster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    map['Poster'] = _poster;
    map['Date'] = _date;
    map['CategoryPoster'] = _categoryPoster;
    return map;
  }

}

// /// Id : 0
// /// Name : "string"
// /// Image : "string"
//
// class Category {
//   Category({
//       num? id,
//       String? name,
//       String? image,}){
//     _id = id;
//     _name = name;
//     _image = image;
// }
//
//   Category.fromJson(dynamic json) {
//     _id = json['Id'];
//     _name = json['Name'];
//     _image = json['Image'];
//   }
//   num? _id;
//   String? _name;
//   String? _image;
// Category copyWith({  num? id,
//   String? name,
//   String? image,
// }) => Category(  id: id ?? _id,
//   name: name ?? _name,
//   image: image ?? _image,
// );
//   num? get id => _id;
//   String? get name => _name;
//   String? get image => _image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['Id'] = _id;
//     map['Name'] = _name;
//     map['Image'] = _image;
//     return map;
//   }
//
// }