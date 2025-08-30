import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/constants.dart';
import '../../../../../core/consts/text_styles.dart';
import '../../../../../core/managers/color_manager.dart';
import '../../../../../core/widgets/network_image_widget.dart';
import '../available_trainings_details_screen.dart';
import 'days_of_traing_widget.dart';

class TrainerDetails extends StatelessWidget {
  TrainerDetails({
    super.key,
    this.trainingDates,
    this.coachName,
    this.coachImageLink,
  });
  List<TrainingDates>? trainingDates;
  final String? coachName;
  final String? coachImageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: LightColors.white,
        border: Border.all(
          color: LightColors.grey.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: NetworkImageWidget(
                    imageLink: coachImageLink ?? '',
                    onErrorWidget: kNetworkImageOnErrorWidget,
                    height: 0.15.sw,
                    width: 0.15.sw,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 3.w),
                Flexible(
                  child: Text(
                    coachName ?? '-',
                    style: AppTextStyle.white_16.copyWith(
                      color: LightColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                for (TrainingDates td in trainingDates ?? []) ...[
                  DaysOfTrainingItem(
                    trainingDay: td.trainingDay,
                    startTime: td.startTime,
                    endTime: td.endTime,
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
