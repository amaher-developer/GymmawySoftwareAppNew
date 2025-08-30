import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/text_styles.dart';
import '../../../../../core/managers/color_manager.dart';

class SubscriptionWidget extends StatelessWidget {
  SubscriptionWidget(
      {super.key,
      this.isWithDiscount,
      this.isFromSubscriptions = false,
      this.onTapWithId,
      this.discount,
      this.duration,
      this.subscriptionPrice,
      this.otherInfo,
      this.onTap,
      this.id,
      this.width});

  final bool? isWithDiscount;
  bool isFromSubscriptions = false;
  final String? duration;
  final String? subscriptionPrice;
  final String? otherInfo;
  final String? discount;
  final Function(int)? onTapWithId;
  final double? width;

  final int? id;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isFromSubscriptions ? () => onTapWithId!(id!) : onTap,
      child: Stack(
        children: [
          Container(
            height: 0.3.sh,
            width: width,
            padding: EdgeInsets.only(top: 15.h, left: 5.w, right: 5.w),
            decoration: BoxDecoration(
              border: isWithDiscount == true
                  ? Border.all(
                      color: LightColors.primary,
                      width: 0.5.w,
                    )
                  : Border.all(
                      color: LightColors.grey,
                      width: 0.5.w,
                    ),
              borderRadius: BorderRadius.circular(10.r),
              color: isWithDiscount == true
                  ? LightColors.primary.withOpacity(0.1)
                  : LightColors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                Flexible(
                  child: Text(
                    duration == null ? '' : '$duration',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: AppTextStyle.white_20.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: LightColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Flexible(
                  child: Text(
                    subscriptionPrice == null ? '' : '$subscriptionPrice',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.white_15.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: LightColors.black,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Flexible(
                  child: SizedBox(
                    width: 0.3.sw,
                    child: Text(
                      otherInfo == null ? '' : '${otherInfo!}',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: AppTextStyle.white_12.copyWith(
                        color: LightColors.grey,
                        fontSize: 11.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isWithDiscount == true)
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                height: 30.h,
                transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                padding: const EdgeInsets.only(bottom: 2, left: 5, right: 5),
                margin: EdgeInsets.only(
                  top: 20.h,
                  bottom: 20.h,
                  left: 20.w,
                  right: 20.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: LightColors.primary.withOpacity(0.9),
                ),
                child: FittedBox(
                  child: Text(
                    discount == null ? 'مجانا' : '$discount',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.white_15.copyWith(
                        color: LightColors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
