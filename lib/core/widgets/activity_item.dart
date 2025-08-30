import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/constants.dart';
import '../consts/text_styles.dart';
import '../managers/color_manager.dart';
import 'network_image_widget.dart';

class ShardCardItem extends StatelessWidget {
  ShardCardItem(
      {Key? key,
      required this.imgUrl,
      this.height,
      this.padding,
      this.itemHeight,
      this.width,
      this.backGroundColor,
      required this.id,
      this.price,
      required this.activityTitle,
      this.onTap,
      this.getIdCallback})
      : super(key: key);
  final String imgUrl;
  final String? price;
  final int id;
  final String activityTitle;
  final VoidCallback? onTap;
  final Function(int)? getIdCallback;
  final double? height;
  EdgeInsetsGeometry? padding;
  final double? width;
  final Color? backGroundColor;
  final double? itemHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: getIdCallback == null
          ? onTap
          : () {
              getIdCallback!(id);
            },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /*     Container(
            width: width ?? 0.60.sw,
            height: itemHeight ?? 0.16.sh,
            padding: padding,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: backGroundColor ?? LightColors.grey.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: LightColors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(1, 1),
                  ),
                ]),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: NetworkImageWidget(
                      imageLink: '${imgUrl}',
                      onErrorWidget: kNetworkImageOnErrorWidget,
                      fit: BoxFit.fill,
                      width: width ?? 0.50.sw,
                      height: height ?? 0.5.sh,
                    )),
                if (price != null)
                  Positioned(
                      top: 12.r,
                      left: 12.r,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: 18.r, horizontal: 10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.black45,
                        ),
                        child: Text(
                          price ?? 'Free',
                          style: AppTextStyle.white_20.copyWith(
                            height: 0.7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
              ],
            ),
          ),*/
          Container(
            width: width ?? 0.60.sw,
            height: itemHeight ?? 0.16.sh,
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: backGroundColor ?? LightColors.white.withOpacity(0.5),
              /*   boxShadow: [
                BoxShadow(
                  color: LightColors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ],*/
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Center(
                  child: NetworkImageWidget(
                    imageLink: imgUrl ??
                        'https://static.toiimg.com/photo/96125662.cms',
                    onErrorWidget: kNetworkImageOnErrorWidget,
                    width: width ?? 0.60.sw,
                    height: height ?? 0.16.sh,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                activityTitle ?? '',
                textAlign: TextAlign.center,
                style: AppTextStyle.white_17.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: LightColors.black,
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
