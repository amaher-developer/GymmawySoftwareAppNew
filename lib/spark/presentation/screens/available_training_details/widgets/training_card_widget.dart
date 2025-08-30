import 'package:zone/core/consts/text_styles.dart';
import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/core/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/constants.dart';
import '../../../../../core/widgets/rounded_container.dart';

class AvailableTrainingCard extends StatelessWidget {
  const AvailableTrainingCard({
    Key? key,
    this.trainingName,
    this.currency,
    this.imageLink,
    this.price,
    this.numberOfTrainingSessions,
    this.getIdCallback,
    required this.id,
  }) : super(key: key);
  final String? trainingName;
  final String? price;
  final String? currency;
  final String? numberOfTrainingSessions;
  final String? imageLink;
  final Function(int)? getIdCallback;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 0.9.sw,
            maxHeight: 0.36.sh,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 0.9.sw,
                  minWidth: 0.9.sw,
                  maxHeight: 0.25.sh,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: LightColors.grey.withOpacity(0.5),
                          width: 1.w,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: NetworkImageWidget(
                          imageLink: imageLink ??
                              'https://images.pexels.com/photos/346776/pexels-photo-346776.jpeg?auto=compress&cs=tinysrgb&w=800',
                          onErrorWidget: kNetworkImageOnErrorWidget,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      end: 10.w,
                      top: 10.h,
                      child: RoundedContainer(
                        backgroundColor: LightColors.black.withOpacity(0.7),
                        width: 80.w,
                        height: 80.h,
                        padding: EdgeInsets.all(10.r),
                        child: Text(
                          '${price} \n ${currency}' ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.white_22.copyWith(height: 1.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        trainingName ?? '',
                        style: AppTextStyle.white_26.copyWith(
                          color: LightColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    RoundedContainer(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 0.3.sw,
                      child: Text(
                        '${numberOfTrainingSessions ?? 0}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.white_18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
