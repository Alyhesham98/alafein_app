// To parse this JSON data, do
//
//     final costModel = costModelFromJson(jsonString);

import 'dart:convert';

CostModel costModelFromJson(String str) => CostModel.fromJson(json.decode(str));

String costModelToJson(CostModel data) => json.encode(data.toJson());

class CostModel {
    double min;
    double max;

    CostModel({
        required this.min,
        required this.max,
    });

    factory CostModel.fromJson(Map<String, dynamic> json) => CostModel(
        min: json["Min"],
        max: json["Max"],
    );

    Map<String, dynamic> toJson() => {
        "Min": min,
        "Max": max,
    };
}
