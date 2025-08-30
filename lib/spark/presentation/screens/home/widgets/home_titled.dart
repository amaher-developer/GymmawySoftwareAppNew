import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/text_styles.dart';
import '../../../../../core/managers/color_manager.dart';

class HomeTitled extends StatelessWidget {
  const HomeTitled({
    super.key,
    this.title,
    this.showMoreAction,
  });

  final String? title;
  final VoidCallback? showMoreAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Text(
            title ?? 'الخطط المتاحة',
            style: AppTextStyle.white_20.copyWith(
              color: LightColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: showMoreAction,
            child: Text(
              StringsAssetsConstants.show_all,
              style: AppTextStyle.white_12.copyWith(
                color: LightColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
