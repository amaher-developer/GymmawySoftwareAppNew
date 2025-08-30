import 'package:zone/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../managers/color_manager.dart';

enum NotificationStatus {
  success,
  error,
  info,
}

Color _getColor(NotificationStatus notificationStatus) {
  switch (notificationStatus) {
    case NotificationStatus.success:
      return LightColors.green;
    case NotificationStatus.error:
      return LightColors.red;
    case NotificationStatus.info:
      return LightColors.grey;
    default:
      return LightColors.grey;
  }
}

Widget showLoadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

void toggleSnackBar({
  required BuildContext context,
  required String content,
  required NotificationStatus status,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: AppTextStyle.white_18.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: _getColor(status),
      ),
    );
}

void showToast({
  required String content,
  required NotificationStatus status,
  required Toast length,
}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: content,
    toastLength: length,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: _getColor(status),
    textColor: LightColors.white,
    fontSize: 16.0,
  );
}
