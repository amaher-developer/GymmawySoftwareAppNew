import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/rounded_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/text_styles.dart';
import '../managers/color_manager.dart';
import '../../spark/presentation/screens/payment_page/payment_screen.dart';
import '../helper/user_helper.dart';

class DetailsOptions extends StatelessWidget {
  const DetailsOptions({
    super.key,
    required this.optionsForDetails,
  });

  final OptionsForDetails optionsForDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RoundedContainer(
            backgroundColor: LightColors.primary.withOpacity(0.08),
            withBorder: true,
            borderWidth: 1.3.r,
            radius: 12.r,
            constraints: BoxConstraints(maxHeight: 50.h),
            onTapped: () {},
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  optionsForDetails.durationIcon ??
                      CupertinoIcons.calendar_today,
                  color: LightColors.primary,
                ),
                SizedBox(width: 4.w),
                SizedBox(
                  height: 30.h,
                  child: FittedBox(
                    child: Text(
                      '${optionsForDetails.durationValue ?? '0'} ',
                      maxLines: 2,
                      style: AppTextStyle.white_24.copyWith(
                        color: LightColors.primary,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.r),
        Expanded(
          child: RoundedContainer(
            backgroundColor: LightColors.primary.withOpacity(0.08),
            borderWidth: 1.3.r,
            radius: 12.r,
            withBorder: true,
            constraints: BoxConstraints(maxHeight: 50.h),
            onTapped: () {},
            alignment: Alignment.center,
            padding: EdgeInsets.all(1.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  optionsForDetails.priceIcon ??
                      CupertinoIcons.money_dollar_circle,
                  color: LightColors.primary,
                ),
                SizedBox(width: 4.w),
                SizedBox(
                  height: 30.h,
                  child: Text(
                    optionsForDetails.priceValue ?? 'مجانية',
                    maxLines: 1,
                    style: AppTextStyle.white_16.copyWith(
                      color: LightColors.primary,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.r),
        (optionsForDetails.isPayment == 0)  ? Expanded(
          child: RoundedContainer(
            borderWidth: 1.3.r,
            radius: 12.r,
            constraints: BoxConstraints(maxHeight: 50.h),
            onTapped: () =>
                optionsForDetails.onBookingOption?.call() ??
                () {
                  print('booking');
                },
            alignment: Alignment.center,
            child: Text(
              StringsAssetsConstants.reserve,
              style: AppTextStyle.white_19.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ) :   (optionsForDetails.isPayment == 1  &&   optionsForDetails.paymentLink != "") ? PaymentButton(url: optionsForDetails.paymentLink ?? '', token: 'Bearer ${UserHelper.getUserToken()}') :const SizedBox(),
      ],
    );
  }
}

class OptionsForDetails {
  final Function? onBookingOption;
  final IconData? durationIcon;
  final IconData? priceIcon;
  final String? priceValue;
  final String? durationValue;
  final int? isPayment;
  final String? paymentLink;

  OptionsForDetails({
    this.durationIcon,
    this.priceIcon,
    this.priceValue,
    this.durationValue,
    this.onBookingOption,
    this.isPayment,
    this.paymentLink
  });
}
