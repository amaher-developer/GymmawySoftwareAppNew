import '../../../domain/entities/banner/banners_entity.dart';

class BannersModel extends BannersEntity {
  const BannersModel({
    final int? id,
    final String? title,
    final String? image,
    final String? date,
    final int? type,
    final String? newTitle,
  }) : super(
          id: id,
          title: title,
          image: image,
          date: date,
          newTitle: newTitle,
          type: type,
        );

  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
      id: json["id"],
      type: json["type"],
      title: json["title"],
      image: json["image"],
      date: json["date"],
      newTitle: json["new_title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "type": type,
        "date": date,
        "new_title": newTitle,
      };

  // model from snapshot
  static List<BannersModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<BannersModel> banners =
        snapShot.map((json) => BannersModel.fromJson(json)).toList();
    return banners;
  }
}
