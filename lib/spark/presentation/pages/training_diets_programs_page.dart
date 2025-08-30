import 'package:zone/core/managers/route_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/spark/presentation/cubit/training_plans/training_plans_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/consts/constants.dart';
import '../../../core/consts/text_styles.dart';
import '../../../core/enums/enums.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_list_tile_card.dart';
import '../../../core/widgets/failure_widget.dart';
import '../../../core/widgets/network_image_widget.dart';

class TrainingAndDietsProgramsPage extends StatelessWidget {
  TrainingAndDietsProgramsPage({Key? key}) : super(key: key);
  List<bool> isNewList = [true, true, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: StringsAssetsConstants.training_diet_system,
        titleFontSize: 20.sp,
        appBarHeight: 70.h,
        textColor: Colors.black,
        isWithImage: false,
        backgroundColor: Colors.transparent,
        backButtonBackgroundColor: Colors.black,
        isBack: true,
      ),
      body: BlocBuilder<TrainingPlansCubit, TrainingPlansState>(
        builder: (context, state) {
          if (state is TrainingPlansLoadingState) {
            return showLoadingIndicator();
          }
          if (state is TrainingPlansErrorState) {
            return Center(
              child: FailureWidget(
                message: state.message,
                onRetry: () {
                  context
                      .read<TrainingPlansCubit>()
                      .getTrainingPlans(TrainingPlans.allType.type);
                },
              ),
            );
          }
          if (state is TrainingPlansSuccessState) {
            return RefreshIndicator(
              onRefresh: () async {
                context
                    .read<TrainingPlansCubit>()
                    .getTrainingPlans(TrainingPlans.allType.type);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0.h),
                child: ListView.separated(
                  itemCount: state.plansEntity.plans.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: CustomListTileCard(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.trainingAndDietsProgramDetail,
                            arguments: {
                              'id': state.plansEntity.plans[index].id,
                            },
                          );
                        },
                        leading: Container(
                          height: .1.sh,
                          width: .19.sw,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0XFFEAEAEA),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: NetworkImageWidget(
                            imageLink:
                                state.plansEntity.plans[index].image ?? '',
                            onErrorWidget: kNetworkImageOnErrorWidget,
                            width: 80.w,
                            height: 80.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        trailing: state.plansEntity.plans[index].newTitle !=
                                    null &&
                                (state.plansEntity.plans[index].newTitle
                                        ?.isNotEmpty ??
                                    false)
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                    color: const Color(0XFFF97D04),
                                    borderRadius: BorderRadius.circular(25.r)),
                                child: Text(
                                  (state.plansEntity.plans[index].newTitle ??
                                      ''),
                                  style: AppTextStyle.white_15BOLD,
                                ),
                              )
                            : null,
                        title: Text(
                          state.plansEntity.plans[index].title ?? '',
                          style: AppTextStyle.black_18BOLD.copyWith(
                            fontSize: 18.sp,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                        subTitle: Text(
                          state.plansEntity.plans[index].shortContent ?? '',
                          style: AppTextStyle.grey_15.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(.7),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 15.h,
                  ),
                ),
              ),
            );
          }
          return Center(
            child: FailureWidget(
              message: 'Unknown error occurred',
              onRetry: () {
                context
                    .read<TrainingPlansCubit>()
                    .getTrainingPlans(TrainingPlans.allType.type);
              },
            ),
          );
        },
      ),
    );
  }
}
