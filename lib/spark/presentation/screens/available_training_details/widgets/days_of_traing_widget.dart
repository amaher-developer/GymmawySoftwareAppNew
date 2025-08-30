import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/text_styles.dart';
import '../../../../../core/managers/color_manager.dart';

class DaysOfTrainingItem extends StatelessWidget {
  const DaysOfTrainingItem({
    super.key,
    this.endTime,
    this.startTime,
    this.trainingDay,
  });
  final String? trainingDay;
  final String? startTime;
  final String? endTime;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Text(
                trainingDay ?? '',
                style: AppTextStyle.black_18.copyWith(
                  color: LightColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${startTime ?? ''} : ${endTime ?? ''}",
                style: AppTextStyle.black_16.copyWith(
                    color: const Color.fromRGBO(85, 85, 85, 1),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(width: 20.w),
          /*  const VerticalDivider(
            color: Colors.black,
            indent: 10,
            endIndent: 10,
          ),*/
        ],
      ),
    );
  }
}
