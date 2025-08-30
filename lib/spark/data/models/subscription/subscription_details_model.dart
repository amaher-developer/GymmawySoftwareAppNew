import '../activty/activities_model.dart';

class SubscriptionDetailsModel {
  int? id;
  String? name;
  String? image;
  String? price;
  String? content;
  String? period;
  String? workouts;
  String? freezeLimit;
  String? numberTimesFreeze;
  String? paymentLink;
  int? isPayment;
  List<ActivitiesModel>? activities;

  SubscriptionDetailsModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.content,
    this.period,
    this.workouts,
    this.freezeLimit,
    this.numberTimesFreeze,
    this.activities,
    this.paymentLink,
    this.isPayment,
  });

  // from json
  factory SubscriptionDetailsModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionDetailsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      content: json['content'],
      period: json['period'],
      workouts: json['workouts'],
      freezeLimit: json['freeze_limit'],
      paymentLink: json['payment_link'],
      isPayment:  json['is_payment'],
      numberTimesFreeze: json['number_times_freeze'],
      activities: ActivitiesModel.modelFromSnapShot(json['activities']),
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['content'] = content;
    data['period'] = period;
    data['workouts'] = workouts;
    data['is_payment'] = isPayment;
    data['freeze_limit'] = freezeLimit;
    data['payment_link'] = paymentLink;
    data['number_times_freeze'] = numberTimesFreeze;
    if (activities != null) {
      data['activities'] = activities!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<SubscriptionDetailsModel> modelFromSnapShot(
      List<dynamic> snapShot) {
    List<SubscriptionDetailsModel> subscriptionData = snapShot
        .map((json) => SubscriptionDetailsModel.fromJson(json))
        .toList();
    return subscriptionData;
  }
}
