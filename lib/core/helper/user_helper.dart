import 'dart:convert';

import 'package:zone/spark/data/models/guest.dart';
import 'package:zone/spark/domain/entities/user/user_login_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHelper {
  String userKey = 'currentUser ';
  String languageKey = 'language';
  String guestData = 'guestData';
  String isGuest = 'isGuest';
  String isFirstTime = 'isFirstTime';
  static late final SharedPreferences _prefs;

  static final UserHelper _instance = UserHelper._internal();

  static UserHelper get instance => _instance;

  UserHelper._internal();

  // init
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    if (!_prefs.containsKey(_instance.languageKey)) {
      _prefs.setString(_instance.languageKey, 'en');
    }
  }

  static setLanguage({required String languageCode}) async {
    _prefs.setString(_instance.languageKey, languageCode);
  }

  static String getLanguage() {
    return _prefs.getString(_instance.languageKey) ?? 'ar';
  }

  static Future<bool> isUserHasSelectedLanguage() async {
    if (!_prefs.containsKey(_instance.languageKey)) return false;
    return true;
  }

  static Future<bool> isUserLoggedIn() async {
    if (!_prefs.containsKey(_instance.userKey)) return false;
    return true;
  }

  static setUser({required UserLoginEntity user}) async {
    Map<String, dynamic> jsonUser = user.toJson();
    _prefs.setString(_instance.userKey, jsonEncode(jsonUser));
  }

  static UserLoginEntity getUser() {
    Map<String, dynamic> userJson =
        jsonDecode(_prefs.getString(_instance.userKey) ?? '{}');
    return UserLoginEntity.fromJson(userJson);
  }

  static Future<bool> clearUser() async {
    return _prefs.remove(_instance.userKey);
  }

  static Future logout() async {
    await _prefs.clear();
  }

  static String? getUserToken() {
    Map<String, dynamic> userJson =
        jsonDecode(_prefs.getString(_instance.userKey) ?? '{}');
    return userJson['token'];
  }

  // getUserPhone
  static String getUserPhone() {
    Map<String, dynamic> userJson =
        jsonDecode(_prefs.getString(_instance.userKey) ?? '{}');
    return userJson['phone'];
  }

  // get name
  static String? getUserName() {
    Map<String, dynamic> userJson =
        jsonDecode(_prefs.getString(_instance.userKey) ?? '');
    return userJson['name'];
  }

  // set guest GuestPhoneAndNameModel
  static setGuestData({required Map<String, dynamic> guestData}) async {
    _prefs.setString(_instance.guestData, jsonEncode(guestData));
  }

  // get guest GuestPhoneAndNameModel
  static GuestPhoneAndNameModel? getGuestData() {
    Map<String, dynamic> guestData =
        jsonDecode(_prefs.getString(_instance.guestData) ?? '{}');
    return GuestPhoneAndNameModel.fromJson(guestData);
  }

  static bool? getIsGuest() {
    return _prefs.getInt(_instance.isGuest) == 1;
  }

  static bool? getIsFirstTime() {
    return _prefs.getInt(_instance.isFirstTime) == 1;
  }

  static setIsFirstTime() {
    _prefs.setInt(_instance.isFirstTime, 1);
  }

  static setIsGuest() {
    _prefs.setInt(_instance.isGuest, 1);
  }

  // delete guest GuestPhoneAndNameModel
  static Future<bool> clearGuestData() async {
    return _prefs.remove(_instance.guestData);
  }

// get email
}
