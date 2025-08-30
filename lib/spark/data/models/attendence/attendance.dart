/*
{

        "attendances": [
            {
                "id": 15,
                "date": "30 مايو 2023",
                "time": "10:50 م",
                "title": "تمرين",
                "type": "صالة"
            },
            {
                "id": 14,
                "date": "30 مايو 2023",
                "time": "11:49 م",
                "title": "تمرين",
                "type": "صالة"
            },
            {
                "id": 13,
                "date": "30 مايو 2023",
                "time": "11:48 م",
                "title": "تمرين",
                "type": "صالة"
            },
            {
                "id": 12,
                "date": "30 مايو 2023",
                "time": "11:45 م",
                "title": "تمرين",
                "type": "صالة"
            },
            {
                "id": 11,
                "date": "30 مايو 2023",
                "time": "11:45 م",
                "title": "تمرين",
                "type": "صالة"
            },
            {
                "id": 10,
                "date": "30 مايو 2023",
                "time": "11:45 م",
                "title": "تمرين",
                "type": "صالة"
            },
            {
                "id": 9,
                "date": "30 مايو 2023",
                "time": "10:14 م",
                "title": "تمرين",
                "type": "صالة"
            }
        ]

}


 */
import 'package:zone/spark/domain/entities/attendence/attendance_entity.dart';

class AttendanceModel extends AttendanceEntity {
  AttendanceModel({
    final int? id,
    final String? date,
    final String? time,
    final String? title,
    final String? type,
  }) : super(
          id: id,
          date: date,
          time: time,
          title: title,
          type: type,
        );

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        id: json["id"],
        date: json["date"],
        time: json["time"],
        title: json["title"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "time": time,
        "title": title,
        "type": type,
      };

  // model from snapshot
  static List<AttendanceModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<AttendanceModel> trainingSessionData =
        snapShot.map((json) => AttendanceModel.fromJson(json)).toList();
    return trainingSessionData;
  }
}
