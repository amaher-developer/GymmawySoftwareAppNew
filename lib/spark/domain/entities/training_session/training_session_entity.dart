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
class TrainingSessionEntity {
  final String? title;
  final String? trainerName;
  final String? trainerImage;
  final String? period;
  final String? date;

  TrainingSessionEntity({
    this.title,
    this.trainerName,
    this.trainerImage,
    this.period,
    this.date,
  });
}
