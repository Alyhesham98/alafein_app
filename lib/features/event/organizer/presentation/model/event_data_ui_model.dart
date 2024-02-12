
import 'dart:convert';

List<EventDataUiModel> eventDataUiModelFromJson(String str) => List<EventDataUiModel>.from(json.decode(str).map((x) => EventDataUiModel.fromJson(x)));

String eventDataUiModelToJson(List<EventDataUiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventDataUiModel {
    int id;
    String name;
    String image;
    bool isPublished;
    int sortNo;

    EventDataUiModel({
        required this.id,
        required this.name,
        required this.image,
        required this.isPublished,
        required this.sortNo,
    });

    factory EventDataUiModel.fromJson(Map<String, dynamic> json) => EventDataUiModel(
        id: json["Id"],
        name: json["Name"],
        image: json["Image"],
        isPublished: json["IsPublished"],
        sortNo: json["SortNo"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Image": image,
        "IsPublished": isPublished,
        "SortNo": sortNo,
    };
}
