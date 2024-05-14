
import 'Profile.dart';

class VenueData {
  VenueData({
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
    List<Schedule>? schedule,
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

  VenueData.fromJson(dynamic json) {
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
    _photos = json['Photos'] != null ? json['Photos'].cast<String>() : [];
    if (json['Facilities'] != null) {
      _facilities = [];
      json['Facilities'].forEach((v) {
        _facilities?.add(Facilities.fromJson(v));
      });
    }
    if (json['Schedule'] != null) {
      _schedule = [];
      json['Schedule'].forEach((v) {
        _schedule?.add(Schedule.fromJson(v));
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
  List<Schedule>? _schedule;
  List<String>? _photos;
  List<Facilities>? _facilities;
  List<Branches>? _branches;
  VenueData copyWith({  num? id,
    String? instagram,
    String? facebook,
    String? websiteURL,
    String? other,
    String? phoneNumber,
    String? venueName,
    String? venueImage,
    String? venueDescription,
    Category? category,
    List<Schedule>? schedule,
    List<String>? photos,
    List<Facilities>? facilities,
    List<Branches>? branches,
  }) => VenueData(  id: id ?? _id,
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
  List<Schedule>? get schedule => _schedule;
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
      map['Schedule'] = _schedule?.map((v) => v.toJson()).toList();
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
