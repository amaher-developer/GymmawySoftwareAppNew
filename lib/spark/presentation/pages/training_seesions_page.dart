import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:zone/core/extensions/date_helper_extensions.dart';
import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/spark/domain/entities/training_session/training_session_entity.dart';
import 'package:zone/spark/presentation/cubit/trining_session/training_sessions_cubit.dart';
import 'package:zone/spark/presentation/cubit/trining_session/training_sessions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/consts/constants.dart';
import '../../../core/consts/text_styles.dart';
import '../../../core/widgets/ListView_shimmer_widget.dart';
import '../../../core/widgets/conditional_builder.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_list_tile_card.dart';
import '../../../core/widgets/failure_widget.dart';
import '../../../core/widgets/network_image_widget.dart';

class TrainingSessionsPage extends StatefulWidget {
  const TrainingSessionsPage({Key? key}) : super(key: key);

  @override
  State<TrainingSessionsPage> createState() => _TrainingSessionsPageState();
}

class _TrainingSessionsPageState extends State<TrainingSessionsPage> {
  int selectedDay = 2;

  @override
  Widget build(BuildContext context) {
    final cubit = TrainingSessionsCubit.get(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.datePickerController.animateToDate(DateTime.now(),
          duration: const Duration(milliseconds: 50));
    });
    return Scaffold(
      appBar: HeaderWidget(
        title: StringsAssetsConstants.training_classes,
        textColor: Colors.black,
        titleFontSize: 20.sp,
        appBarHeight: 60.h,
        isWithImage: false,
        backgroundColor: LightColors.white,
        backButtonBackgroundColor: Colors.black,
        isBack: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          cubit.getTrainingSessions(
            date: cubit.selectedValue.dateOnlyText,
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0.h),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    cubit.initialDate,
                    controller: cubit.datePickerController,
                    initialSelectedDate: cubit.currentDate,
                    selectionColor: LightColors.primary,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected

                      cubit.selectedValue = date;
                      cubit.getTrainingSessions(
                        date: cubit.selectedValue.dateOnlyText,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              BlocBuilder<TrainingSessionsCubit, TrainingSessionsState>(
                builder: (context, state) {
                  return ConditionalBuilder(
                    condition: state is TrainingSessionsErrorState,
                    builder: (context) =>
                        // error
                        Center(
                      child: Center(
                        child: FailureWidget(
                          message:
                              (state as TrainingSessionsErrorState).message,
                          onRetry: () {
                            cubit.getTrainingSessions(
                              date: cubit.selectedValue.dateOnlyText,
                            );
                          },
                        ),
                      ),
                    ),
                    fallback: (context) => ConditionalBuilder(
                      condition: state is TrainingSessionsLoadingState,
                      builder: (context) => const ListViewLoadingWidget(),
                      fallback: (context) => ConditionalBuilder(
                        condition: cubit.trainingSessions.isEmpty,
                        builder: (context) => Expanded(
                          child: Center(
                            child: Text(
                              StringsAssetsConstants.no_training_classes,
                              style: AppTextStyle.black_18BOLD.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        fallback: (context) => Expanded(
                          child: ListView.separated(
                            itemCount: cubit.trainingSessions.length,
                            itemBuilder: (context, index) {
                              TrainingSessionEntity? trainingSessions =
                                  cubit.trainingSessions[index];
                              return TrainingSessionItem(
                                  trainingSessions: trainingSessions);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 15.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainingSessionItem extends StatelessWidget {
  const TrainingSessionItem({
    super.key,
    required this.trainingSessions,
  });

  final TrainingSessionEntity? trainingSessions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomListTileCard(
        leading: SizedBox(
          width: .42.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: .4.sw,
                height: .05.sh,
                child: Text(
                  trainingSessions?.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.black_18BOLD
                      .copyWith(fontSize: 20, height: 1.5),
                ),
              ),
              SizedBox(
                height: .047.sh,
                width: .5.sw,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: NetworkImageWidget(
                        height: 40.r,
                        width: 40.r,
                        imageLink: trainingSessions?.trainerImage ?? '',
                        onErrorWidget: kNetworkImageOnErrorWidget,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      width: .3.sw,
                      child: Text(
                        (trainingSessions?.trainerName ?? '') * 5,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyle.grey_15.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.withOpacity(.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        trailing: SizedBox(
          width: .3.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: const Color(0XFFF97D04),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  trainingSessions?.period ?? '-',
                  style: AppTextStyle.white_15BOLD,
                ),
              ),
              SizedBox(
                height: .047.sh,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      trainingSessions?.date ?? '',
                      style: AppTextStyle.grey_18
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
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
