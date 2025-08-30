import 'package:zone/core/managers/route_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/spark/presentation/cubit/available_trainings/training_reserivation/training_reservation_cubit.dart';
import 'package:zone/spark/presentation/screens/available_training_details/widgets/training_details_options.dart';
import 'package:zone/spark/presentation/screens/available_training_details/widgets/training_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/consts/text_styles.dart';
import '../../../../core/helper/user_helper.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/details_potions.dart';
import '../../../../core/widgets/dialog_messages.dart';
import '../../../../core/widgets/failure_widget.dart';
import '../../../../core/widgets/header_image.dart';
import '../../cubit/available_trainings/training_details/training_details_cubit.dart';
import '../payment_page/payment_screen.dart';

class AvailableTrainingsScreenDetailsView extends StatelessWidget {
  final int trainingId;

  const AvailableTrainingsScreenDetailsView(
      {required this.trainingId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSaved = false;
    return BlocListener<TrainingReservationCubit, TrainingReservationState>(
      listener: (context, state) {
        if (state is TrainingReservationSuccessState) {
          showAlertDialog(
            isDismissible: true,
            onOkayButtonPressed: () {
              Navigator.of(context).pop();
            },
            okButtonTitle: StringsAssetsConstants.agree,
            message: state.reservationModel?.message ??
                StringsAssetsConstants.operation_done_successfully,
            iconData: CupertinoIcons.check_mark_circled,
          );
        } else if (state is TrainingReservationErrorState) {
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
      child: BlocBuilder<TrainingReservationCubit, TrainingReservationState>(
        builder: (context, state) {
          if (state is TrainingReservationLoadingState) {
            return Scaffold(
              body: showLoadingIndicator(),
            );
          }
          return BlocBuilder<TrainingDetailsCubit, TrainingDetailsState>(
            builder: (context, state) {
              if (state is TrainingDetailsLoadingState) {
                return Scaffold(
                  body: showLoadingIndicator(),
                );
              }
              if (state is TrainingDetailsErrorState) {
                return Scaffold(
                  body: Center(
                    child: FailureWidget(
                      message: state.message,
                      onRetry: () {
                        context
                            .read<TrainingDetailsCubit>()
                            .getTrainingDetails(trainingId);
                      },
                    ),
                  ),
                );
              }
              if (state is TrainingDetailsSuccessState) {
                return Scaffold(
                  backgroundColor: LightColors.white,
                  appBar: HeaderWidget(
                    titleFontSize: 20.sp,
                    appBarHeight: 79.h,
                    appBarTitlePadding: EdgeInsetsDirectional.only(
                        start: 20.w, end: 15.w, top: 10),
                    backgroundColor: LightColors.primary,
                    title: state.trainingDetails.name,
                    isWithImage: true,
                    serverImageLink: state.trainingDetails.image,
                    isBack: true,
                  ),
                  body: SafeArea(
                    child: Column(
                      children: [
                        HeaderImage(
                          serverImageLink: state.trainingDetails.image,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.r, horizontal: 20.r),
                                  child: TrainingDetailsOptions(
                                    optionsForDetails: OptionsForDetails(
                                      priceIcon:
                                          CupertinoIcons.money_dollar_circle,
                                      paymentLink: state.trainingDetails.payment_link,
                                      priceValue: state.trainingDetails.price,
                                      durationIcon: CupertinoIcons.calendar,
                                      isPayment: state.trainingDetails.is_payment,
                                      durationValue:
                                          state.trainingDetails.classes,
                                      onBookingOption: () async {
                                        if (UserHelper.getUserToken() == null &&
                                            UserHelper.getGuestData()?.phone ==
                                                null) {
                                          isSaved = await Navigator.of(context)
                                              .pushNamed(Routes.register,
                                                  arguments: {
                                                'isFromTraining': true,
                                                'id': trainingId
                                              }) as bool;
                                          if (isSaved) {
                                            context
                                                .read<
                                                    TrainingReservationCubit>()
                                                .reserveTraining(
                                                    trainingId: trainingId);
                                          }
                                        } else {
                                          context
                                              .read<TrainingReservationCubit>()
                                              .reserveTraining(
                                                  trainingId: trainingId);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.r),
                                  child: Text(
                                    state.trainingDetails.content,
                                    style: AppTextStyle.white_17.copyWith(
                                      color: LightColors.textColor
                                          .withOpacity(0.45),
                                      height: 1.4,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                SizedBox(height: 15.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Text(
                                    StringsAssetsConstants
                                        .available_trainers_for_training,
                                    style: AppTextStyle.white_19.copyWith(
                                      color: LightColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount:
                                      state.trainingDetails.trainers.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 20.w),
                                    child: TrainerDetails(
                                      coachImageLink: state.trainingDetails
                                          .trainers[index].image,
                                      coachName: state
                                          .trainingDetails.trainers[index].name,
                                      trainingDates: state.trainingDetails
                                          .trainers[index].reservations
                                          .map((reservation) => TrainingDates(
                                                trainingDay: reservation.day,
                                                startTime: reservation.timeFrom,
                                                endTime: reservation.timeTo,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Scaffold(
                body: Center(
                  child: FailureWidget(
                    message: StringsAssetsConstants.unknown_error,
                    onRetry: () {
                      context
                          .read<TrainingDetailsCubit>()
                          .getTrainingDetails(trainingId);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TrainingDates {
  final String? trainingDay;
  final String? startTime;
  final String? endTime;

  TrainingDates({
    this.trainingDay,
    this.startTime,
    this.endTime,
  });
}
