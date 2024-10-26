import 'attendance_option.dart';
import 'category.dart';
import 'organizer.dart';
import 'venue.dart';

class EventDeatilsModel {
  int? id;
  String? poster;
  Category? category;
  bool? isFavorite;
  String? NameEn;
  String? NameAr;
  Organizer? organizer;
  String? description;
  String? descriptionEn;
  String? descriptionAr;
  String? date;
  AttendanceOption? attendanceOption;
  String? url;
  num? paymentFee;
  String? address;
  String? mapLink;
  dynamic eventOrganizer;
  Venue? venue;

  EventDeatilsModel({
    this.id,
    this.poster,
    this.category,
    this.isFavorite,
    this.NameEn,
    this.NameAr,
    this.organizer,
    this.description,
    this.descriptionEn,
    this.descriptionAr,
    this.date,
    this.attendanceOption,
    this.url,
    this.paymentFee,
    this.address,
    this.mapLink,
    this.eventOrganizer,
    this.venue,
  });

  factory EventDeatilsModel.fromJson(Map<String, dynamic> json) {
    return EventDeatilsModel(
      id: json['Id'] as int?,
      poster: json['Poster'] as String?,
      category: json['Category'] == null
          ? null
          : Category.fromJson(json['Category'] as Map<String, dynamic>),
      isFavorite: json['IsFavourite'],
      NameEn: json['NameEn'] as String?,
      NameAr: json['NameAr'] as String?,
      organizer: json['Organizer'] == null
          ? null
          : Organizer.fromJson(json['Organizer'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      descriptionEn: json['DescriptionEn'] as String?,
      descriptionAr: json['DescriptionAr'] as String?,
      date: json['Date'] as String?,
      attendanceOption: json['AttendanceOption'] == null
          ? null
          : AttendanceOption.fromJson(
              json['AttendanceOption'] as Map<String, dynamic>),
      url: json['URL'] as String?,
      paymentFee: json['PaymentFee'] as num?,
      address: json['Address'] as String?,
      mapLink: json['MapLink'] as String?,
      eventOrganizer: json['EventOrganizer'] as dynamic,
      venue: json['Venue'] == null
          ? null
          : Venue.fromJson(json['Venue'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Poster': poster,
        'Category': category?.toJson(),
        'IsFavorite': isFavorite,
        'NameEn': NameEn,
        'NameAr': NameAr,
        'Organizer': organizer?.toJson(),
        'Description': description,
        'Date': date,
        'AttendanceOption': attendanceOption?.toJson(),
        'URL': url,
        'PaymentFee': paymentFee,
        'Address': address,
        'MapLink': mapLink,
        'EventOrganizer': eventOrganizer,
        'Venue': venue?.toJson(),
      };
}
