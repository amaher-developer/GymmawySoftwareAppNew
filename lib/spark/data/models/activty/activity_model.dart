import 'package:zone/spark/domain/entities/activity/activity_enrtity.dart';

class ActivityModel extends ActivityEntity {
  const ActivityModel({
    required int id,
    required String name,
    required String image,
    required String price,
    required String content,
    required String payment_link,
    required int is_payment,
  }) : super(
          id: id,
          name: name,
          image: image,
          price: price,
          content: content,
          payment_link: payment_link,
          is_payment:is_payment,
        );

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
        id: json['id'] ?? 0,
        name: json['name'],
        image: json['image'],
        price: json['price'],
        payment_link: json['payment_link'],
        is_payment: json['is_payment'],
        content: json['content']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['payment_link'] = payment_link;
    data['is_payment'] = is_payment;
    data['content'] = content;
    return data;
  }

  // model from snapshot
  static ActivityModel modelFromSnapShot(Map<String, dynamic> snapShot) {
    ActivityModel activity = ActivityModel.fromJson(snapShot);
    return activity;
  }
}
