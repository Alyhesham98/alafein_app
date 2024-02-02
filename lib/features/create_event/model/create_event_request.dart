import 'dart:convert';

class CreateEventRequest {
  String eventNameEn;
  String eventNameAr;
  String eventDescriptionEn;
  String eventDescriptionAr;
  String mainArtestNameEn;
  String mainArtestNameAr;
  bool kidsAvailability;
  int attendanceOption;
  String url;
  int paymentFee;
  String poster;
  String contactPerson;
  String addtionalComment;
  int categoryId;
  int venueId;
  int branchId;
  int repeat;
  List<String> dates;

  CreateEventRequest({
    required this.eventNameEn,
    required this.eventNameAr,
    required this.eventDescriptionEn,
    required this.eventDescriptionAr,
    required this.mainArtestNameEn,
    required this.mainArtestNameAr,
    required this.kidsAvailability,
    required this.attendanceOption,
    required this.url,
    required this.paymentFee,
    required this.poster,
    required this.contactPerson,
    required this.addtionalComment,
    required this.categoryId,
    required this.venueId,
    required this.branchId,
    required this.repeat,
    required this.dates,
  });

  @override
  String toString() {
    return 'Create(eventNameEn: $eventNameEn, eventNameAr: $eventNameAr, eventDescriptionEn: $eventDescriptionEn, eventDescriptionAr: $eventDescriptionAr, mainArtestNameEn: $mainArtestNameEn, mainArtestNameAr: $mainArtestNameAr, kidsAvailability: $kidsAvailability, attendanceOption: $attendanceOption, url: $url, paymentFee: $paymentFee, poster: $poster, contactPerson: $contactPerson, addtionalComment: $addtionalComment, categoryId: $categoryId, venueId: $venueId, branchId: $branchId, repeat: $repeat, dates: $dates)';
  }

  factory CreateEventRequest.fromMap(Map<String, dynamic> data) =>
      CreateEventRequest(
        eventNameEn: data['eventNameEN'] as String,
        eventNameAr: data['eventNameAR'] as String,
        eventDescriptionEn: data['eventDescriptionEN'] as String,
        eventDescriptionAr: data['eventDescriptionAR'] as String,
        mainArtestNameEn: data['mainArtestNameEN'] as String,
        mainArtestNameAr: data['mainArtestNameAR'] as String,
        kidsAvailability: data['kidsAvailability'] as bool,
        attendanceOption: data['attendanceOption'] as int,
        url: data['url'] as String,
        paymentFee: data['paymentFee'] as int,
        poster: data['poster'] as String,
        contactPerson: data['contactPerson'] as String,
        addtionalComment: data['addtionalComment'] as String,
        categoryId: data['categoryId'] as int,
        venueId: data['venueId'] as int,
        branchId: data['branchId'] as int,
        repeat: data['repeat'] as int,
        dates:
            (data['dates'] as List<dynamic>).map((e) => e as String).toList(),
      );

  Map<String, dynamic> toMap() => {
        'eventNameEN': eventNameEn,
        'eventNameAR': eventNameAr,
        'eventDescriptionEN': eventDescriptionEn,
        'eventDescriptionAR': eventDescriptionAr,
        'mainArtestNameEN': mainArtestNameEn,
        'mainArtestNameAR': mainArtestNameAr,
        'kidsAvailability': kidsAvailability,
        'attendanceOption': attendanceOption,
        'url': url,
        'paymentFee': paymentFee,
        'poster': poster,
        'contactPerson': contactPerson,
        'addtionalComment': addtionalComment,
        'categoryId': categoryId,
        'venueId': venueId,
        'branchId': branchId,
        'repeat': repeat,
        'dates': dates.map((e) => e).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreateEventRequest].
  factory CreateEventRequest.fromJson(String data) {
    return CreateEventRequest.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreateEventRequest] to a JSON string.
  String toJson() => json.encode(toMap());

  CreateEventRequest copyWith({
    String? eventNameEn,
    String? eventNameAr,
    String? eventDescriptionEn,
    String? eventDescriptionAr,
    String? mainArtestNameEn,
    String? mainArtestNameAr,
    bool? kidsAvailability,
    int? attendanceOption,
    String? url,
    int? paymentFee,
    String? poster,
    String? contactPerson,
    String? addtionalComment,
    int? categoryId,
    int? venueId,
    int? branchId,
    int? repeat,
    List<String>? dates,
  }) {
    return CreateEventRequest(
      eventNameEn: eventNameEn ?? this.eventNameEn,
      eventNameAr: eventNameAr ?? this.eventNameAr,
      eventDescriptionEn: eventDescriptionEn ?? this.eventDescriptionEn,
      eventDescriptionAr: eventDescriptionAr ?? this.eventDescriptionAr,
      mainArtestNameEn: mainArtestNameEn ?? this.mainArtestNameEn,
      mainArtestNameAr: mainArtestNameAr ?? this.mainArtestNameAr,
      kidsAvailability: kidsAvailability ?? this.kidsAvailability,
      attendanceOption: attendanceOption ?? this.attendanceOption,
      url: url ?? this.url,
      paymentFee: paymentFee ?? this.paymentFee,
      poster: poster ?? this.poster,
      contactPerson: contactPerson ?? this.contactPerson,
      addtionalComment: addtionalComment ?? this.addtionalComment,
      categoryId: categoryId ?? this.categoryId,
      venueId: venueId ?? this.venueId,
      branchId: branchId ?? this.branchId,
      repeat: repeat ?? this.repeat,
      dates: dates ?? this.dates,
    );
  }
}
