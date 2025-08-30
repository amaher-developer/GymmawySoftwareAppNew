import 'package:zone/core/consts/text_styles.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/user_helper.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/route_manager.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/dialog_messages.dart';
import '../../../../core/widgets/header_image.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../../../../core/widgets/show_price_card.dart';
import '../../../data/models/home_utils_model.dart';
import '../../../domain/entities/activity/activity_enrtity.dart';
import '../../../domain/entities/activity/activties_entity.dart';
import '../../cubit/activites/avtivity_deatails/activity_details_cubit.dart';
import '../../cubit/available_trainings/training_reserivation/training_reservation_cubit.dart';
import '../home/widgets/home_slides.dart';
import '../payment_page/payment_screen.dart';

class ActivityDetailsScreen extends StatelessWidget {
  ActivityDetailsScreen({
    Key? key,
    this.id = -1,
  }) : super(key: key);
  final int id;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final cubit = ActivityDetailsCubit.get(context);
    return BlocConsumer<ActivityDetailsCubit, ActivityDetailsState>(
      listener: (context, state) {
        print('state is $state');
        if (state is SuccessReserveActivityState) {
          showAlertDialog(
            isDismissible: true,
            onOkayButtonPressed: () {
              Navigator.of(context).pop();
            },
            okButtonTitle: StringsAssetsConstants.agree,
            message: state.reservation.message ??
                StringsAssetsConstants.operation_done_successfully,
            iconData: CupertinoIcons.check_mark_circled,
          );
        } else if (state is ErrorReserveActivityState) {
          {
            showAlertDialog(
              isDismissible: true,
              onOkayButtonPressed: () {
                Navigator.of(context).pop();
              },
              okButtonTitle: StringsAssetsConstants.agree,
              message: state.message,
              iconData: CupertinoIcons.check_mark_circled,
            );
          }
        }
      },
      buildWhen: (previous, current) {
        if (current is SuccessReserveActivityState ||
            current is ErrorReserveActivityState ||
            current is ActivityDetailsLoadingState) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (state is ActivityDetailsLoadingState) {
          return Scaffold(
            body: showLoadingIndicator(),
          );
        } else if (state is ActivityDetailsErrorState) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        }

        final ActivityEntity activityEntity =
            (state as ActivityDetailsSuccessState)
                .activityDetails
                .activityEntity;
        final List<ActivitiesEntity> activitiesEntity =
            state.activityDetails.activitiesEntity;
        return Scaffold(
          appBar: HeaderWidget(
            title: activityEntity.name,
            appBarHeight: 85.h,
            titleFontSize: 20.sp,
            backgroundColor: LightColors.primary,
            isWithImage: true,
            serverImageLink:
                'https://metricool.com/wp-content/uploads/jason-blackeye-364785-2.jpg',
            isBack: true,
          ),
          body: SafeArea(
            child: ListView(
              children: [
                HeaderImage(
                  serverImageLink: activityEntity.image,
                  imageFit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.r,
                    horizontal: 25.r,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShowPriceButton(
                        price: activityEntity.price,
                      ),
                      SizedBox(width: 10.r),
                      (activityEntity.is_payment == 0)  ? RoundedContainer(
                        width: 0.33.sw,
                        borderWidth: 1.3.r,
                        radius: 12.r,
                        constraints: BoxConstraints(maxHeight: 50.h),
                        onTapped: () async {
                          if (UserHelper.getUserToken() == null &&
                              UserHelper.getGuestData()?.phone == null) {
                            isSaved = await Navigator.of(context)
                                .pushNamed(Routes.register, arguments: {
                              'isFromSubscription': true,
                              'id': id,
                            }) as bool;
                            if (isSaved) {
                              cubit.reserveActivity(id);
                            }
                          } else {
                            await cubit.reserveActivity(id);
                          }
                        },
                        alignment: Alignment.center,
                        child: Text(
                          StringsAssetsConstants.reserve,
                          style: AppTextStyle.white_19.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ) :   (activityEntity.is_payment == 1  &&  activityEntity.payment_link != "" && activityEntity.payment_link != null) ? PaymentButton(url: activityEntity.payment_link ?? '', token: 'Bearer ${UserHelper.getUserToken()}') :const SizedBox(),



                    ],

                  ),
                ),
                // booki
                SizedBox(
                  height: 10.h,
                ),

                /// Point to return
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Text(
                    activityEntity.content * 1,
                    textAlign: TextAlign.justify,
                    style: AppTextStyle.black_18BOLD.copyWith(
                      color: LightColors.black.withOpacity(.45),
                      fontSize: 17,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: (activityEntity.content.toString().length) < 38
                      ? 20.h
                      : 220.h,
                ),
                SizedBox(
                  width: 1.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          StringsAssetsConstants.more_activities,
                          style: AppTextStyle.black_18BOLD.copyWith(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                MoreSlidesWidget(
                  itemHeight: 0.16.sh,
                  getIdCallback: (int selectedActivityId) {
                    Navigator.of(context).pushReplacementNamed(
                      Routes.activityDetails,
                      arguments: {'id': selectedActivityId},
                    );
                  },
                  model: activitiesEntity
                      .map(
                        (activity) => HomeUtilsModel(
                          title: activity.name,
                          image: activity.image,
                          id: activity.id,
                        ),
                      )
                      .toList(),
                  width: 0.33.sw,
                  height: 0.22.sh,
                ),

                SizedBox(height: 10.h),
                // Payment Button

              ],
            ),
          ),
        );
      },
    );
  }
}
