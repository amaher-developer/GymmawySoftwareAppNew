// gallery response
/*
{
    "result": {
        "gallery": [
            "https://sw.gymmawy.com/121951680396109.jpg",
            "https://sw.gymmawy.com/62441680396113.jpg",
            "https://sw.gymmawy.com/23991680396124.jpg",
            "https://sw.gymmawy.com/192011680396130.jpg",
            "https://sw.gymmawy.com/59161680396135.jpg",
            "https://sw.gymmawy.com/97221680396140.jpg",
            "https://sw.gymmawy.com/12811680396146.jpg",
            "https://sw.gymmawy.com/26961680396153.jpg",
            "https://sw.gymmawy.com/11711680396158.jpg",
            "https://sw.gymmawy.com/157871680396167.jpg",
            "https://sw.gymmawy.com/145131680396175.jpg",
            "https://sw.gymmawy.com/94341680434928.jpg"
        ]
    },
    "status": 200,
    "success": true,
    "message": "OK"
}
 */
class GalleryModel {
  GalleryModel({
    required this.result,
    required this.status,
    required this.success,
    required this.message,
  });

  final Result result;
  final int status;
  final bool success;
  final String message;

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        result: Result.fromJson(json["result"]),
        status: json["status"],
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "status": status,
        "success": success,
        "message": message,
      };
}

class Result {
  Result({
    required this.gallery,
  });

  final List<String> gallery;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gallery: List<String>.from(json["gallery"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
      };
}
