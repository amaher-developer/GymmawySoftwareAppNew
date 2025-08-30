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
// creating traks model

class TrackEntity {
  TrackEntity({
    this.id,
    this.title,
    this.image,
    this.shortContent,
    this.newTitle,
  });

  final int? id;
  final String? title;
  final String? image;
  final String? shortContent;
  final String? newTitle;
}
