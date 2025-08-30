import 'dart:io';

import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/spark/presentation/cubit/splash/splash_cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../consts/constants.dart';
import '../consts/text_styles.dart';

Future<void> forceUpdateDialog() async {
  const appId = 'com.geek.infinity';
  final url = Uri.parse(
    Platform.isAndroid
        ? "market://details?id=$appId"
        : "https://apps.apple.com/app/id$appId",
  );

  final splashCubit = SplashCubit.get(navigatorKey.currentContext!);
  print('android version: ${splashCubit.splashEntity?.androidVersion}');
  if (Platform.isIOS) {
    print('ios version: ${splashCubit.splashEntity?.iosVersion}');
    if ((splashCubit.splashEntity?.iosVersion == null ||
            splashCubit.splashEntity?.iosVersion != kIosVersion) &&
        splashCubit.splashEntity?.terms != null) {
      await showDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'هناك تحديث جديد',
                style: AppTextStyle.black_18BOLD.copyWith(
                  fontWeight: FontWeight.bold,
                  color: LightColors.primary,
                ),
              ),
              content: Text(
                'يتوجب عليك تحديث التطبيق للاستمرار',
                style: AppTextStyle.black_16,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Text(
                    'تحديث',
                    style: AppTextStyle.black_18BOLD.copyWith(
                        fontWeight: FontWeight.bold,
                        color: LightColors.primary),
                  ),
                ),
              ],
            );
          });
    }
  } else if (Platform.isAndroid) {
    print('android version: ${splashCubit.splashEntity?.androidVersion}');
    if ((splashCubit.splashEntity?.androidVersion == null ||
            splashCubit.splashEntity?.androidVersion != kAndroidVersion) &&
        splashCubit.splashEntity?.terms != null) {
      await showDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text(
                StringsAssetsConstants.update_app,
                style: AppTextStyle.black_18BOLD.copyWith(
                  fontWeight: FontWeight.bold,
                  color: LightColors.primary,
                ),
              ),
              content: Text(
                StringsAssetsConstants.you_must_update_the_app_to_continue,
                style: AppTextStyle.black_16,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    try {
                      launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } on PlatformException catch (e) {
                      launch(
                          "https://play.google.com/store/apps/details?id=$appId");
                    }
                  },
                  child: Text(
                    StringsAssetsConstants.update,
                    style: AppTextStyle.black_18BOLD.copyWith(
                        fontWeight: FontWeight.bold,
                        color: LightColors.primary),
                  ),
                ),
              ],
            );
          });
    }
  }
}
