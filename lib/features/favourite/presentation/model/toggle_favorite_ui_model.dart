// To parse this JSON data, do
//
//     final toggleFavoriteDataUiModel = toggleFavoriteDataUiModelFromJson(jsonString);

import 'dart:convert';

ToggleFavoriteDataUiModel toggleFavoriteDataUiModelFromJson(String str) => ToggleFavoriteDataUiModel.fromJson(json.decode(str));

String toggleFavoriteDataUiModelToJson(ToggleFavoriteDataUiModel data) => json.encode(data.toJson());

class ToggleFavoriteDataUiModel {
    bool succeeded;
    dynamic message;
    dynamic errors;
    bool data;

    ToggleFavoriteDataUiModel({
        required this.succeeded,
        required this.message,
        required this.errors,
        required this.data,
    });

    factory ToggleFavoriteDataUiModel.fromJson(Map<String, dynamic> json) => ToggleFavoriteDataUiModel(
        succeeded: json["Succeeded"],
        message: json["Message"],
        errors: json["Errors"],
        data: json["Data"],
    );

    Map<String, dynamic> toJson() => {
        "Succeeded": succeeded,
        "Message": message,
        "Errors": errors,
        "Data": data,
    };
}
