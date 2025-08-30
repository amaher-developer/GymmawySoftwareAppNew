import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/consts/text_styles.dart';
import '../../../../core/managers/color_manager.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String date;
  final bool isRead;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: LightColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: LightColors.grey.withOpacity(.2),
            blurRadius: 10.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(
              color: isRead ? LightColors.primary : LightColors.grey,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.black_18BOLD.copyWith(
                    color: LightColors.black,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  subTitle,
                  style: AppTextStyle.black_18BOLD.copyWith(
                    color: LightColors.black.withOpacity(.5),
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            date,
            style: AppTextStyle.black_18BOLD.copyWith(
              color: LightColors.black.withOpacity(.5),
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
