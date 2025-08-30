import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/constants.dart';
import '../../../../../core/consts/text_styles.dart';
import '../../../../../core/managers/color_manager.dart';
import '../../../../../core/widgets/network_image_widget.dart';
import '../../../../../core/widgets/rounded_container.dart';

class DetailsPortions extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageLink;
  const DetailsPortions({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imageLink,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: LightColors.grey.withOpacity(0.5),
                width: 0.5.w,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: NetworkImageWidget(
                imageLink: imageLink,
                onErrorWidget: kNetworkImageOnErrorWidget,
                height: 90.h,
                width: 0.9.sw,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedContainer(
                  padding: EdgeInsets.all(3.r),
                  alignment: Alignment.center,
                  width: 100.w,
                  height: 30.w,
                  radius: 10.r,
                  child: FittedBox(
                    child: SizedBox(
                      height: 30.h,
                      child: Text(
                        title,
                        style: AppTextStyle.white_16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 0.4.sw,
                  child: Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.white_13.copyWith(
                      color: LightColors.textColor.withOpacity(0.8),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
