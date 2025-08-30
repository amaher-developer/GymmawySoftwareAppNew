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
class AttendanceEntity {
  AttendanceEntity({
    this.id,
    this.date,
    this.time,
    this.title,
    this.type,
  });

  final int? id;
  final String? date;
  final String? time;
  final String? title;
  final String? type;
}
