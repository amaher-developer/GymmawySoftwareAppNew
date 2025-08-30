import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/header_and_value.dart';

class SubscriptionsOtherDetails extends StatelessWidget {
  const SubscriptionsOtherDetails({
    Key? key,
    this.numberOfTraining,
    this.numberOfFreezingDays,
    this.duration,
  }) : super(key: key);
  final String? numberOfTraining;
  final String? numberOfFreezingDays;
  final String? duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
      child: RoundedContainer(
        padding: EdgeInsets.all(12.r),
        backgroundColor: LightColors.white,
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderAndValueWidget(
                header: StringsAssetsConstants.workout_days,
                value: numberOfTraining ?? '-',
                valueColor: LightColors.black,
                headerColor: LightColors.primary,
              ),
              VerticalDivider(
                color: LightColors.grey,
                thickness: 0.4.w,
                width: 20.r,
              ),
              HeaderAndValueWidget(
                header: StringsAssetsConstants.freezing_days,
                value: numberOfFreezingDays ?? '-',
                valueColor: LightColors.black,
                headerColor: LightColors.primary,
              ),
              VerticalDivider(
                color: LightColors.grey,
                thickness: 0.4.w,
                width: 20.r,
              ),
              HeaderAndValueWidget(
                header: StringsAssetsConstants.freezing_numbers,
                value: duration ?? '-',
                valueColor: LightColors.black,
                headerColor: LightColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
