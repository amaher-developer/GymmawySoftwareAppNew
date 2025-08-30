import 'package:equatable/equatable.dart';

class SplashEntity extends Equatable {
  final String phone;
  final String? facebook;
  final int? isExpired;
  final String? twitter;
  final String? instagram;
  final String supportEmail;
  final String latitude;
  final String longitude;
  final String terms;
  final String iosVersion;
  final String androidVersion;
  final String mapLocationImage;
  final String mapLocationLink;
  final String? tiktok;
  final String? snapchat;

  const SplashEntity({
    required this.phone,
    this.facebook,
    required this.androidVersion,
    this.tiktok,
    this.snapchat,
    required this.iosVersion,
    this.isExpired,
    this.twitter,
    this.instagram,
    required this.supportEmail,
    required this.latitude,
    required this.longitude,
    required this.mapLocationLink,
    required this.terms,
    required this.mapLocationImage,
  });

  @override
  List<Object?> get props => [
        phone,
        facebook,
        twitter,
        instagram,
        isExpired,
        androidVersion,
        iosVersion,
        tiktok,
        snapchat,
        supportEmail,
        latitude,
        longitude,
        terms,
        iosVersion,
        androidVersion,
        mapLocationImage,
      ];
}
