import 'dart:convert';

import 'attendance.dart';
import 'category.dart';
import 'repeat.dart';
import 'venue.dart';

class DropdownResponse {
  List<Category>? category;
  List<Venue>? venue;
  List<Repeat>? repeat;
  List<Attendance>? attendance;

  DropdownResponse({
    this.category,
    this.venue,
    this.repeat,
    this.attendance,
  });

  @override
  String toString() {
    return 'DropdownResponse(category: $category, venue: $venue, repeat: $repeat, attendance: $attendance)';
  }

  factory DropdownResponse.fromMap(Map<String, dynamic> data) {
    return DropdownResponse(
      category: (data['Category'] as List<dynamic>?)
          ?.map((e) => Category.fromMap(e as Map<String, dynamic>))
          .toList(),
      venue: (data['Venue'] as List<dynamic>?)
          ?.map((e) => Venue.fromMap(e as Map<String, dynamic>))
          .toList(),
      repeat: (data['Repeat'] as List<dynamic>?)
          ?.map((e) => Repeat.fromMap(e as Map<String, dynamic>))
          .toList(),
      attendance: (data['Attendance'] as List<dynamic>?)
          ?.map((e) => Attendance.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'Category': category?.map((e) => e.toMap()).toList(),
        'Venue': venue?.map((e) => e.toMap()).toList(),
        'Repeat': repeat?.map((e) => e.toMap()).toList(),
        'Attendance': attendance?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DropdownResponse].
  factory DropdownResponse.fromJson(String data) {
    return DropdownResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DropdownResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  DropdownResponse copyWith({
    List<Category>? category,
    List<Venue>? venue,
    List<Repeat>? repeat,
    List<Attendance>? attendance,
  }) {
    return DropdownResponse(
      category: category ?? this.category,
      venue: venue ?? this.venue,
      repeat: repeat ?? this.repeat,
      attendance: attendance ?? this.attendance,
    );
  }
}
