import 'package:zone/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/color_manager.dart';
import 'custom_elevated_button.dart';

class FailureWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const FailureWidget({
    Key? key,
    required this.message,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: AppTextStyle.darkGrey_18BOLD.copyWith(
              fontSize: 32.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.0.h,
          ),
          if (onRetry != null)
            CustomElevatedButton(
              onPressed: onRetry,
              text: 'Retry',
              width: 1.sw,
              backgroundColor: LightColors.primary,
              height: 80.h,
              icon: Icons.refresh,
              capitalize: true,
            ),
        ],
      ),
    );
  }
}
