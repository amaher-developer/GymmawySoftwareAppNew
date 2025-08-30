import 'package:zone/core/widgets/network_image_widget.dart';
import 'package:zone/spark/data/models/home_utils_model.dart';
import 'package:zone/spark/data/models/subscription/subscription_model.dart';
import 'package:zone/spark/presentation/screens/subscriptions/widgets/subscription_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/constants.dart';
import '../../../../../core/consts/text_styles.dart';
import '../../../../../core/managers/color_manager.dart';

class MoreSlidesWidget extends StatelessWidget {
  //TODO: Will pass Model here and remove all the parameters
  MoreSlidesWidget(
      {super.key,
      this.height,
      this.width,
      this.onTap,
      this.itemHeight,
      this.padding,
      this.imageFit,
      this.priceBackgroundColor,
      this.isOffer,
      this.model = const [],
      this.subscriptions = const [],
      this.getIdCallback,
      this.backGroundColor,
      this.subscriptionWidth});

  final double? height;
  EdgeInsetsGeometry? padding;
  final Color? priceBackgroundColor;
  final double? width;
  final double? subscriptionWidth;
  final BoxFit? imageFit;
  final VoidCallback? onTap;
  final Function(int)? getIdCallback;
  List<HomeUtilsModel?>? model;
  List<SubscriptionModel?>? subscriptions;
  final Color? backGroundColor;
  final bool? isOffer;
  final double? itemHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 150.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: isOffer == true ? 17.h : 0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //TODO: implement onTap
            },
            child: isOffer == true
                ? Row(
                    children: [
                      /// margin for the first item
                      if (index == 0) SizedBox(width: 20.w),
                      SubscriptionWidget(
                        isWithDiscount: subscriptions?[index]?.isDiscount == 1,
                        subscriptionPrice: subscriptions?[index]?.price,
                        duration: subscriptions?[index]?.name,
                        otherInfo: subscriptions?[index]?.shortDescription,
                        discount: subscriptions?[index]?.discount,
                        width: subscriptionWidth,
                        onTap: getIdCallback == null
                            ? onTap
                            : () {
                                getIdCallback!(subscriptions?[index]!.id! ?? 0);
                              },
                      ),
                    ],
                  )
                : InkWell(
                    onTap: getIdCallback == null
                        ? onTap
                        : () {
                            getIdCallback!(model?[index]!.id! ?? 0);
                          },
                    child: Row(
                      children: [
                        /// margin for the first item
                        if (index == 0) SizedBox(width: 20.w),
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: width ?? 0.60.sw,
                                  height: itemHeight ?? 0.16.sh,
                                  padding: padding,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: backGroundColor ??
                                        LightColors.white.withOpacity(0.5),
                                    border: Border.all(
                                      color: LightColors.grey.withOpacity(0.2),
                                      width: 1,
                                    ),
                                    /* boxShadow: [
                                      BoxShadow(
                                        color:
                                            LightColors.grey.withOpacity(0.2),
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
                                      child: NetworkImageWidget(
                                        imageLink: model?[index]?.image ??
                                            'https://static.toiimg.com/photo/96125662.cms',
                                        onErrorWidget:
                                            kNetworkImageOnErrorWidget,
                                        width: width ?? 0.60.sw,
                                        fit: imageFit ?? BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                // Row of the name and the price and colored container with the price
                                SizedBox(
                                  width: width ?? 0.60.sw,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          model?[index]?.name ??
                                              model?[index]?.title ??
                                              '',
                                          textAlign: (width == 0.60.sw)
                                              ? TextAlign.start
                                              : TextAlign.center,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyle.white_16.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: LightColors.black,
                                            height: 1.5,
                                          ),
                                        ),
                                      ),
                                      if ((width ?? 0.40.sw) >= 0.55.sw)
                                        Container(
                                          width: 0.20.sw,
                                          height: 0.03.sh,
                                          padding: EdgeInsets.all(5.r),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                            color: LightColors.primary,
                                          ),
                                          child: Center(
                                            child: FittedBox(
                                              child: Text(
                                                model?[index]?.classes ?? '-',
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle.white_12
                                                    .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      SizedBox(width: 10.w)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            model?[index]?.price == null ||
                                    model?[index]?.price == ''
                                ? const SizedBox.shrink()
                                : PositionedDirectional(
                                    top: 15.h,
                                    end: 10.w,
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 0.15.sw,
                                      ),
                                      padding: EdgeInsets.all(5.r),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: priceBackgroundColor ??
                                            Colors.white.withOpacity(0.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${model?[index]?.price} \n ${model?[index]?.priceUnit}' ??
                                              '0',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyle.white_14.copyWith(
                                            fontWeight: FontWeight.w700,
                                            height: 1.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        },
        itemCount: isOffer == true ? subscriptions!.length : model!.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10.w);
        },
      ),
    );
  }
}
