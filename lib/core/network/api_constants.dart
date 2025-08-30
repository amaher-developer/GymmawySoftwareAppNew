import 'dart:io';

class ApiConstants {
  static const String baseUrl = 'https://redbone.gymmawy.com/api/';
  static String token =
      '4jzrLooNqodz17LCp28aNlBdXia0yYcLe4mPlDwUkJrUz2lCBBRE8EZ3nvwR';
  static const String home = 'home';
  static String deviceType = Platform.isAndroid ? 'android' : 'ios';
  static const String deviceToken = 'test';
  static const String arLang = 'ar';
  static const String enLang = 'en';
  static const String subscription = 'subscription';
  static const String subscriptionDetails = 'subscription/{id}';
  static const String gallery = 'gallery';
  static const String store = 'store/{id}';
  static const String storeProducts = 'store';
  static const String banner = 'banner/{id}';
  static const String activity = 'activity/{id}';
  static const String getTrainings = 'pt-training';
  static const String trainingReservation = 'pt-training/reservation/{id}';
  static const String subscriptionReservation = 'subscription/reservation/{id}';
  static const String getProfile = 'member_info';
  static const String trainingSessions = 'pt-training-classes';
  static const String tracks = 'training-track';
  static const String trackDetails = 'training-track/{id}';
  static const String attendances = 'attendances';
  static const String reserveActivity = 'activity/reservation/{id}';
  //deleteAccount
  static const String deleteAccount = 'member_block';
  static const String freezeAccount = 'member-subscription-freeze';

}
