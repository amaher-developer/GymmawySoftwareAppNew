import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/text_styles.dart';

class HomeContactUsCard extends StatelessWidget {
  const HomeContactUsCard({
    super.key,
    this.firstNumber,
    this.secondNumber,
    this.onTap,
  });

  final String? firstNumber;
  final String? secondNumber;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 5.h),
        decoration: BoxDecoration(
/*          color: LightColors.primary,
          */ /* gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              LightColors.primary,
              LightColors.primary.withOpacity(0.7),
            ],
          ),*/
          borderRadius: BorderRadius.circular(12.r),
          // add decoration  with network image
          image: const DecorationImage(
            image: AssetImage('assets/icons/contact.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Text(
              StringsAssetsConstants.contact_us,
              style: AppTextStyle.white_24.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstNumber ?? '',
                  textDirection: TextDirection.ltr,
                  style: AppTextStyle.white_18.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (secondNumber != null &&
                    (secondNumber?.isNotEmpty ?? false)) ...[
                  Text(
                    '   -   ',
                    style: AppTextStyle.white_18.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    secondNumber ?? '',
                    textDirection: TextDirection.ltr,
                    style: AppTextStyle.white_19.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
