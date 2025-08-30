/*
 {

        "classes": [
            {
                "title": "سباحه رجال",
                "trainer_name": "احمد ماهر",
                "trainer_image": "https://gymmawy.com/resources/assets/front/img/preview_icon.png",
                "period": "3 ساعة",
                "date": "2023-06-03"
            },
            {
                "title": "سباحه سيدات",
                "trainer_name": "رنيا علواني",
                "trainer_image": "https://gymmawy.com/resources/assets/front/img/preview_icon.png",
                "period": "1 ساعة",
                "date": "2023-06-03"
            }
        ]
    },


 */
// create training session model
import '../../../domain/entities/training_session/training_session_entity.dart';

class TrainingSessionModel extends TrainingSessionEntity {
  TrainingSessionModel({
    final String? title,
    final String? trainerName,
    final String? trainerImage,
    final String? period,
    final String? date,
  }) : super(
          title: title,
          trainerName: trainerName,
          trainerImage: trainerImage,
          period: period,
          date: date,
        );

  factory TrainingSessionModel.fromJson(Map<String, dynamic> json) {
    return TrainingSessionModel(
      title: json['title'],
      trainerName: json['trainer_name'],
      trainerImage: json['trainer_image'],
      period: json['period'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['trainer_name'] = trainerName;
    data['trainer_image'] = trainerImage;
    data['period'] = period;
    data['date'] = date;
    return data;
  }

  // model from snapshot
  static List<TrainingSessionModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<TrainingSessionModel> trainingSessionData =
        snapShot.map((json) => TrainingSessionModel.fromJson(json)).toList();
    return trainingSessionData;
  }
}
