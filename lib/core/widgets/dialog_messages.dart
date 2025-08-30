import 'package:zone/core/consts/text_styles.dart';
import 'package:zone/core/managers/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

showAlertDialog({
  final String? message,
  final String? okButtonTitle,
  final IconData? iconData,
  final VoidCallback? onOkayButtonPressed,
  final VoidCallback? onNoButtonPressed,
  final String? noButtonTitle,
  final bool? isDismissible,
}) {
  // set up the button
  Widget okButton = onOkayButtonPressed != null
      ? Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          child: Center(
            child: TextButton(
              onPressed: onOkayButtonPressed,
              style: ButtonStyle(
                /*  overlayColor:
                    MaterialStateProperty.all(LightColors.white.withOpacity(0.3)),*/
                minimumSize: MaterialStateProperty.all(Size(0.6.sw, 0.04.sh)),
                backgroundColor: MaterialStateProperty.all(LightColors.white),
              ),
              child: Text(
                okButtonTitle ?? 'حسنا',
                style: AppTextStyle.white_22.copyWith(
                  color: LightColors.primary,
                ),
              ),
            ),
          ),
        )
      : const SizedBox.shrink();
  Widget noButton = onNoButtonPressed != null
      ? TextButton(
          onPressed: onOkayButtonPressed,
          child: Text(
            noButtonTitle ?? 'لا',
            style: AppTextStyle.white_22,
          ),
        )
      : const SizedBox.shrink();

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: LightColors.primary,
    title: Center(
      child: Icon(
        iconData ?? CupertinoIcons.checkmark_alt_circle,
        size: 50.r,
        color: LightColors.white,
      ),
    ),
    insetPadding: EdgeInsets.symmetric(horizontal: 0.05.sw),
    content: SizedBox(
      width: 1.sw,
      child: Text(
        message ??
            "تم حجز التدريب وستم التواصل معاك من قبل سبارك جيم علي رقم  01001234678",
        textAlign: TextAlign.center,
        style: AppTextStyle.white_20.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
    actions: [
      okButton,
      noButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierColor: LightColors.white.withOpacity(0.8),
    context: navigatorKey.currentContext!,
    barrierDismissible: isDismissible ?? true,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
