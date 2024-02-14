// To parse this JSON data, do
//
//     final profilePageDataUiModel2 = profilePageDataUiModel2FromJson(jsonString);

import 'dart:convert';

ProfilePageDataUiModel2 profilePageDataUiModel2FromJson(String str) => ProfilePageDataUiModel2.fromJson(json.decode(str));

String profilePageDataUiModel2ToJson(ProfilePageDataUiModel2 data) => json.encode(data.toJson());

class ProfilePageDataUiModel2 {
    String id;
    String firstName;
    String lastName;
    String email;
    String photo;
    String phone;
    Venue venue;
    Organizer organizer;

    ProfilePageDataUiModel2({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.photo,
        required this.phone,
        required this.venue,
        required this.organizer,
    });

    factory ProfilePageDataUiModel2.fromJson(Map<String, dynamic> json) => ProfilePageDataUiModel2(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        photo: json["photo"],
        phone: json["phone"],
        venue: Venue.fromJson(json["venue"]),
        organizer: Organizer.fromJson(json["organizer"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "photo": photo,
        "phone": phone,
        "venue": venue.toJson(),
        "organizer": organizer.toJson(),
    };
}

class Organizer {
    int id;
    String mapLink;
    String address;
    String instagram;
    String facebook;
    String websiteUrl;
    String other;
    String description;
    Category category;

    Organizer({
        required this.id,
        required this.mapLink,
        required this.address,
        required this.instagram,
        required this.facebook,
        required this.websiteUrl,
        required this.other,
        required this.description,
        required this.category,
    });

    factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
        id: json["id"],
        mapLink: json["mapLink"],
        address: json["address"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        websiteUrl: json["websiteURL"],
        other: json["other"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "mapLink": mapLink,
        "address": address,
        "instagram": instagram,
        "facebook": facebook,
        "websiteURL": websiteUrl,
        "other": other,
        "description": description,
        "category": category.toJson(),
    };
}

class Category {
    int id;
    String name;
    String image;

    Category({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}

class Venue {
    int id;
    String instagram;
    String facebook;
    String websiteUrl;
    String other;
    String phoneNumber;
    String venueName;
    String venueDescription;
    Category category;
    List<String> photos;
    List<Facility> facilities;
    List<Branch> branches;

    Venue({
        required this.id,
        required this.instagram,
        required this.facebook,
        required this.websiteUrl,
        required this.other,
        required this.phoneNumber,
        required this.venueName,
        required this.venueDescription,
        required this.category,
        required this.photos,
        required this.facilities,
        required this.branches,
    });

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        websiteUrl: json["websiteURL"],
        other: json["other"],
        phoneNumber: json["phoneNumber"],
        venueName: json["venueName"],
        venueDescription: json["venueDescription"],
        category: Category.fromJson(json["category"]),
        photos: List<String>.from(json["photos"].map((x) => x)),
        facilities: List<Facility>.from(json["facilities"].map((x) => Facility.fromJson(x))),
        branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "instagram": instagram,
        "facebook": facebook,
        "websiteURL": websiteUrl,
        "other": other,
        "phoneNumber": phoneNumber,
        "venueName": venueName,
        "venueDescription": venueDescription,
        "category": category.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "facilities": List<dynamic>.from(facilities.map((x) => x.toJson())),
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
    };
}

class Branch {
    int id;
    String name;
    String address;
    String mapLink;
    List<WorkDay> workDay;

    Branch({
        required this.id,
        required this.name,
        required this.address,
        required this.mapLink,
        required this.workDay,
    });

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        mapLink: json["mapLink"],
        workDay: List<WorkDay>.from(json["workDay"].map((x) => WorkDay.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "mapLink": mapLink,
        "workDay": List<dynamic>.from(workDay.map((x) => x.toJson())),
    };
}

class WorkDay {
    int id;
    Day day;
    String from;
    String to;

    WorkDay({
        required this.id,
        required this.day,
        required this.from,
        required this.to,
    });

    factory WorkDay.fromJson(Map<String, dynamic> json) => WorkDay(
        id: json["id"],
        day: Day.fromJson(json["day"]),
        from: json["from"],
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "day": day.toJson(),
        "from": from,
        "to": to,
    };
}

class Day {
    int id;
    String name;

    Day({
        required this.id,
        required this.name,
    });

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Facility {
    int id;
    String imagePath;
    String imageName;

    Facility({
        required this.id,
        required this.imagePath,
        required this.imageName,
    });

    factory Facility.fromJson(Map<String, dynamic> json) => Facility(
        id: json["id"],
        imagePath: json["imagePath"],
        imageName: json["imageName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "imagePath": imagePath,
        "imageName": imageName,
    };
}
