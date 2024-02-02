class AttendanceOption {
  int? id;
  String? name;

  AttendanceOption({this.id, this.name});

  factory AttendanceOption.fromJson(Map<String, dynamic> json) {
    return AttendanceOption(
      id: json['Id'] as int?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
      };
}
