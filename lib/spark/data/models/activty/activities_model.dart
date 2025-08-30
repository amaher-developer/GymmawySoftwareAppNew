import 'package:zone/spark/domain/entities/activity/activties_entity.dart';

class ActivitiesModel extends ActivitiesEntity {
  const ActivitiesModel({
    required int id,
    required String name,
    required String image,
    required String price,
  }) : super(
          id: id,
          name: name,
          image: image,
          price: price,
        );

  factory ActivitiesModel.fromJson(Map<String, dynamic> json) {
    return ActivitiesModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    return data;
  }

  // model from snapshot
  static List<ActivitiesModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<ActivitiesModel> activityData =
        snapShot.map((json) => ActivitiesModel.fromJson(json)).toList();
    return activityData;
  }
}
