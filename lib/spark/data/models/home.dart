import 'package:zone/spark/data/models/home_utils_model.dart';
import 'package:zone/spark/data/models/subscription/subscription_model.dart';

import '../../domain/entities/home/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel(
      {List<HomeUtilsModel>? banners,
      List<SubscriptionModel>? subscriptions,
      int? isTrainings,
      int? isNewNotifications,
      String? welcomeMember,
      List<HomeUtilsModel>? trainings,
      int? isActivities,
      List<HomeUtilsModel>? activities,
      int? isStores,
      List<HomeUtilsModel>? stores,
      List<String>? phones,
      String? welcomeMessage,
      int? isExpired})
      : super(
          welcomeMessage: welcomeMessage,
          banners: banners,
          phones: phones,
          welcomeMember: welcomeMember,
          isNewNotifications: isNewNotifications,
          subscriptions: subscriptions,
          isTrainings: isTrainings,
          trainings: trainings,
          isActivities: isActivities,
          activities: activities,
          isStores: isStores,
          stores: stores,
          isExpired: isExpired,
        );

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      welcomeMessage: json["welcome_msg"],
      welcomeMember: json["welcome_member"],
      isExpired: json["is_expired"],
      isNewNotifications: json["is_new_notifications"],
      phones: List.from(json["phones"]),
      banners: HomeUtilsModel.modelFromSnapShot(json["banners"]),
      subscriptions: SubscriptionModel.modelFromSnapShot(json["subscriptions"]),
      isTrainings: json["is_trainings"],
      trainings: HomeUtilsModel.modelFromSnapShot(json["trainings"]),
      isActivities: json["is_activities"],
      activities: HomeUtilsModel.modelFromSnapShot(json["activities"]),
      isStores: json["is_stores"],
      stores: HomeUtilsModel.modelFromSnapShot(json["stores"]),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phones'] = phones;
    data['is_expired'] = isExpired;
    data['is_new_notifications'] = isNewNotifications;
    data['welcome_member'] = welcomeMember;
    data['banners'] = banners?.map((v) => v.toJson()).toList();
    data['subscriptions'] = subscriptions?.map((v) => v.toJson()).toList();
    data['is_trainings'] = isTrainings;
    data['trainings'] = trainings?.map((v) => v.toJson()).toList();
    data['is_activities'] = isActivities;
    data['activities'] = activities?.map((v) => v.toJson()).toList();
    data['is_stores'] = isStores;
    data['stores'] = stores?.map((v) => v.toJson()).toList();
    data['welcome_msg'] = welcomeMessage;
    return data;
  }

  static List<HomeModel> modelFromSnapShot(List<dynamic> snapShot) {
    List<HomeModel> homeData =
        snapShot.map((json) => HomeModel.fromJson(json)).toList();
    return homeData;
  }
}
