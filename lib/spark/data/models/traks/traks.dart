/*
{
         "tracks": [
            {
                "id": 3,
                "title": "2023-05-26T16:15:28.000000Z",
                "image": "https://sw.gymmawy.com/resources/assets/front/images/bar_training.png",
                "short_content": "2023-05-26T16:15:28.000000Z",
                "is_new": 0
            },
            {
                "id": 2,
                "title": "2023-05-26T16:15:09.000000Z",
                "image": "https://sw.gymmawy.com/resources/assets/front/images/bar_training.png",
                "short_content": "2023-05-26T16:15:09.000000Z",
                "is_new": 0
            }
        ]


}


 */
import '../../../domain/entities/traks/traks_entity.dart';

class TrackModel extends TrackEntity {
  TrackModel({
    final int? id,
    final String? title,
    final String? image,
    final String? shortContent,
    final String? newTitle,
  }) : super(
          id: id,
          title: title,
          image: image,
          shortContent: shortContent,
          newTitle: newTitle,
        );

  factory TrackModel.fromJson(Map<String, dynamic> json) => TrackModel(
        id: json["id"],
        title: (json["title"]),
        image: json["image"],
        shortContent: json["short_content"],
        newTitle: json["new_title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "short_content": shortContent,
        "new_title": newTitle,
      };

// model from snapshot
  static List<TrackModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<TrackModel> trainingSessionData =
        snapShot.map((json) => TrackModel.fromJson(json)).toList();
    return trainingSessionData;
  }
}
