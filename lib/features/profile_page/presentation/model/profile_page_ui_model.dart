// // To parse this JSON data, do
// //
// //     final profilePageDataUiModel = profilePageDataUiModelFromJson(jsonString);

// import 'dart:convert';

// ProfilePageDataUiModel profilePageDataUiModelFromJson(String str) => ProfilePageDataUiModel.fromJson(json.decode(str));

// String profilePageDataUiModelToJson(ProfilePageDataUiModel data) => json.encode(data.toJson());

// class ProfilePageDataUiModel {
//     String id;
//     String firstName;
//     String lastName;
//     String email;
//     dynamic photo;
//     dynamic phone;

//     ProfilePageDataUiModel({
//         required this.id,
//         required this.firstName,
//         required this.lastName,
//         required this.email,
//         required this.photo,
//         required this.phone,
//     });

//     factory ProfilePageDataUiModel.fromJson(Map<String, dynamic> json) => ProfilePageDataUiModel(
//         id: json["Id"],
//         firstName: json["FirstName"],
//         lastName: json["LastName"],
//         email: json["Email"],
//         photo: json["Photo"],
//         phone: json["Phone"],
//     );

//     Map<String, dynamic> toJson() => {
//         "Id": id,
//         "FirstName": firstName,
//         "LastName": lastName,
//         "Email": email,
//         "Photo": photo,
//         "Phone": phone,
//     };
// }
