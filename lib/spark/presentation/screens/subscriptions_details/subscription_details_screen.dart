import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/conditional_builder.dart';
import 'package:zone/core/widgets/details_potions.dart';
import 'package:zone/spark/presentation/cubit/login/login_cubit.dart';
import 'package:zone/spark/presentation/cubit/subscription_details/subscription_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/subscription_details/subscription_details_state.dart';
import 'package:zone/spark/presentation/screens/subscriptions_details/widgets/details_portion_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/consts/text_styles.dart';
import '../../../../core/helper/user_helper.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/route_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/dialog_messages.dart';
import '../../../../core/widgets/header_image.dart';
import '../payment_page/payment_screen.dart';
import 'widgets/subscription_details_options.dart';
import 'widgets/subscriptions_other_details.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
  SubscriptionDetailsScreen({
    Key? key,
    this.id = -1,
  }) : super(key: key);

  final int id;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final cubit = SubscriptionDetailsCubit.get(context);
    return BlocConsumer<SubscriptionDetailsCubit, SubscriptionDetailsStates>(
      listener: (context, state) {
        // Add your listener code here
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: LightColors.white,
          appBar: HeaderWidget(
            title: cubit.subscriptionDetails?.name ?? '',
            titleFontSize: 20.sp,
            backgroundColor: LightColors.primary,
            isWithImage: true,
            isBack: true,
            appBarHeight: 85.h,
          ),
          body: SafeArea(
            child: ListView(
              children: [
                // Add your existing widgets here
                HeaderImage(
                  serverImageLink: cubit.subscriptionDetails?.image ?? '',
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: SubscriptionDetailsOptions(
                    optionsForDetails: OptionsForDetails(
                      priceIcon: CupertinoIcons.money_dollar_circle,
                      priceValue: cubit.subscriptionDetails?.price,
                      durationIcon: CupertinoIcons.clock,
                      paymentLink: cubit.subscriptionDetails?.paymentLink,
                      durationValue: cubit.subscriptionDetails?.period,
                      isPayment: cubit.subscriptionDetails?.isPayment,
                      onBookingOption: () async {
                        if (UserHelper.getUserToken() == null &&
                            UserHelper.getGuestData()?.phone == null) {
                          isSaved = await Navigator.of(context)
                              .pushNamed(Routes.register, arguments: {
                            'isFromSubscription': true,
                            'id': id,
                          }) as bool;
                          if (isSaved) {
                            cubit.reserveSubscription(
                                id, context.read<LoginCubit>());
                          }
                        } else {
                          await cubit.reserveSubscription(
                            id,
                            context.read<LoginCubit>(),
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Text(
                    cubit.subscriptionDetails?.content ?? '-',
                    style: AppTextStyle.white_16.copyWith(
                      color: LightColors.textColor.withOpacity(0.45),
                      height: 1.8,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SubscriptionsOtherDetails(
                  numberOfTraining: cubit.subscriptionDetails?.workouts,
                  numberOfFreezingDays: cubit.subscriptionDetails?.freezeLimit,
                  duration: cubit.subscriptionDetails?.numberTimesFreeze,
                ),
                if (cubit.subscriptionDetails?.activities?.isNotEmpty ??
                    false) ...[
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: Text(
                      StringsAssetsConstants.available_trainings_and_activities,
                      style: AppTextStyle.white_20.copyWith(
                        color: LightColors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  // create grid view of training itme that have image and duration time title and description
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15.r),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.subscriptionDetails?.activities?.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25.r,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.6,
                    ),
                    itemBuilder: (context, index) {
                      return DetailsPortions(
                        title: cubit.subscriptionDetails
                            ?.activities?[index].price ??
                            '',
                        subTitle: cubit.subscriptionDetails
                            ?.activities?[index].name ??
                            '',
                        imageLink: cubit.subscriptionDetails
                            ?.activities?[index].image ??
                            '',
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

