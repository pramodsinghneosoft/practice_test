// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AlarmModel welcomeFromJson(String str) => AlarmModel.fromJson(json.decode(str));

String welcomeToJson(AlarmModel data) => json.encode(data.toMap());

class AlarmModel {
  AlarmModel({
    this.id,
    this.title,
    this.alarmDateTime,
    this.isPending,
    this.gradientColorIndex,
  });

  int id;
  String title;
  DateTime alarmDateTime;
  bool isPending;
  int gradientColorIndex;

  factory AlarmModel.fromJson(Map<String, dynamic> json) => AlarmModel(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
        isPending: json["isPending"],
        gradientColorIndex: json["gradientColorIndex"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime.toIso8601String(),
        "isPending": isPending,
        "gradientColorIndex": gradientColorIndex,
      };
}
