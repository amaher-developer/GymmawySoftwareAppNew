import '../../../domain/entities/splash/splash_entity.dart';

class SplashModel extends SplashEntity {
  const SplashModel({
    required String phone,
    String? facebook,
    String? twitter,
    String? instagram,
    String? tiktok,
    String? snapchat,
    int? isExpired,
    required String supportEmail,
    required String latitude,
    required String longitude,
    required String terms,
    required String iosVersion,
    required String androidVersion,
    required String mapLocationImage,
    required String mapLocationLink,
  }) : super(
          phone: phone,
          facebook: facebook,
          tiktok: tiktok,
          snapchat: snapchat,
          twitter: twitter,
          mapLocationLink: mapLocationLink,
          androidVersion: androidVersion,
          iosVersion: iosVersion,
          isExpired: isExpired,
          instagram: instagram,
          supportEmail: supportEmail,
          latitude: latitude,
          longitude: longitude,
          terms: terms,
          mapLocationImage: mapLocationImage,
        );

  factory SplashModel.fromJson(Map<String, dynamic> json) {
    print('is expired: ${json['is_expired']}) ');
    return SplashModel(
      phone: json['settings']['phone'],
      tiktok: json['settings']['tiktok'],
      snapchat: json['settings']['snapchat'],
      mapLocationLink: json['settings']['map_link'],
      isExpired: json['is_expired'],
      facebook: json['settings']['facebook'],
      twitter: json['settings']['twitter'],
      instagram: json['settings']['instagram'],
      supportEmail: json['settings']['support_email'],
      latitude: json['settings']['latitude'],
      longitude: json['settings']['longitude'],
      terms: json['settings']['terms'],
      iosVersion: json['settings']['ios_version'],
      androidVersion: json['settings']['android_version'],
      mapLocationImage: json['settings']['map_location_image'],
    );
  }

  static SplashModel modelFromSnapShot(Map<String, dynamic> snapShot) {
    final Map<String, dynamic> result = snapShot['result'];

    return SplashModel.fromJson(result);
  }
}
