class RegistrationUserModel {
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String profilePicture;
  late String roleId;

  RegistrationUserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.profilePicture,
      required this.roleId});

  RegistrationUserModel.fromJson(Map<String, String> json) {
    firstName = json['firstName']!;
    lastName = json['lastName']!;
    email = json['email']!;
    password = json['password']!;
    profilePicture = json['profilePicture']!;
    roleId = json['roleId']!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['profilePicture'] = profilePicture;
    data['roleId'] = roleId;
    return data;
  }
}
