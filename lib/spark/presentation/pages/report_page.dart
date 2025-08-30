import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/conditional_builder.dart';
import 'package:zone/spark/presentation/cubit/track_details/track_details_cubit.dart';
import 'package:zone/spark/presentation/cubit/track_details/track_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../core/consts/text_styles.dart';
import '../../../core/managers/color_manager.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/failure_widget.dart';
import '../../../core/widgets/header_and_value.dart';
import '../../../core/widgets/rounded_container.dart';

class ReportPage extends StatelessWidget {
  ReportPage({
    Key? key,
    this.id,
  }) : super(key: key);
  int? id = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: StringsAssetsConstants.tracking,
        appBarTitlePadding:
            EdgeInsetsDirectional.only(start: 25.w, end: 20.w, top: 10),
        titleFontSize: 20.sp,
        appBarHeight: 60.h,
        textColor: Colors.black,
        isWithImage: false,
        backgroundColor: Colors.transparent,
        backButtonBackgroundColor: LightColors.black,
        isBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Container(
          padding: EdgeInsets.only(bottom: 20.h),
          height: 1.sh,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: LightColors.grey.withOpacity(.5),
                width: 1,
              )),
          child: BlocBuilder<TrackDetailsCubit, TrackDetailsState>(
            builder: (context, state) {
              final cubit = TrackDetailsCubit.get(context);
              return ConditionalBuilder(
                condition: state is TrackDetailsErrorState,
                builder: (context) {
                  return Center(
                    child: Center(
                      child: FailureWidget(
                        message: (state as TrackDetailsErrorState).message,
                        onRetry: () {
                          cubit.getTrackDetails(id: id ?? -1);
                        },
                      ),
                    ),
                  );
                },
                fallback: (context) => ConditionalBuilder(
                  condition: state is TrackDetailsLoadingState,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fallback: (context) => ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      RoundedContainer(
                        radius: 12.r,
                        padding: EdgeInsets.all(12.r),
                        backgroundColor: LightColors.primary,
                        child: Column(
                          children: [
                            // creat text that have date of day
                            Text(
                              cubit.trackDetails?.date ?? '-',
                              style: AppTextStyle.white_18.copyWith(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  HeaderAndValueWidget(
                                    header: cubit.trackDetails?.weight,
                                    headerHeight: 40.h,
                                    valueHeight: 30.h,
                                    headerStyle: AppTextStyle.white_22.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    value: 'الوزن',
                                  ),
                                  VerticalDivider(
                                    color: LightColors.white,
                                    thickness: 1.w,
                                    width: 20.r,
                                  ),
                                  HeaderAndValueWidget(
                                    header: cubit.trackDetails?.height,
                                    headerHeight: 40.h,
                                    valueHeight: 30.h,
                                    headerStyle: AppTextStyle.white_25.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    value: 'الطول',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          cubit.trackDetails?.shortContent ?? '-',
                          style: AppTextStyle.black_18BOLD.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 550.h,
                        child: RefreshIndicator(
                          onRefresh: () async {
                            cubit.getTrackDetails(id: id ?? -1);
                          },
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(20.r),
                              child: HtmlWidget(
                                cubit.trackDetails?.report ?? '-',
                                textStyle: AppTextStyle.white_18.copyWith(
                                  color: LightColors.textColor.withOpacity(0.7),
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
