import 'package:zone/spark/data/models/subscription/subscription_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/home_utils_model.dart';

class HomeEntity extends Equatable {
  final List<HomeUtilsModel>? banners;
  final List<SubscriptionModel>? subscriptions;
  final int? isTrainings;
  int? isNewNotifications;
  final List<HomeUtilsModel>? trainings;
  final int? isActivities;
  final List<HomeUtilsModel>? activities;
  final int? isStores;
  final List<HomeUtilsModel>? stores;
  final List<String>? phones;
  final String? welcomeMessage;
  final String? welcomeMember;
  final int? isExpired;

  HomeEntity({
    this.banners,
    this.phones,
    this.subscriptions,
    this.isExpired,
    this.isTrainings,
    this.isNewNotifications,
    this.trainings,
    this.isActivities,
    this.welcomeMember,
    this.activities,
    this.isStores,
    this.stores,
    this.welcomeMessage,
  });

  @override
  List<Object?> get props => [
        banners,
        subscriptions,
        isTrainings,
        trainings,
        isActivities,
        activities,
        isStores,
        isExpired,
        phones,
        stores,
        welcomeMessage,
        welcomeMember,
        isNewNotifications,
      ];
}
