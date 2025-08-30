import 'package:zone/spark/domain/entities/attendence/attendance_entity.dart';
import 'package:zone/spark/presentation/cubit/attendances/attendances_cubit.dart';
import 'package:zone/spark/presentation/cubit/attendances/attendances_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/consts/text_styles.dart';
import '../../../core/managers/strings_assets_constants.dart';
import '../../../core/widgets/ListView_shimmer_widget.dart';
import '../../../core/widgets/conditional_builder.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_list_tile_card.dart';
import '../../../core/widgets/failure_widget.dart';

class AttendanceSessionsPage extends StatelessWidget {
  const AttendanceSessionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: StringsAssetsConstants.attendance_classes,
        textColor: Colors.black,
        titleFontSize: 20.sp,
        appBarHeight: 60.h,
        isWithImage: false,
        backgroundColor: Colors.transparent,
        backButtonBackgroundColor: Colors.black,
        isBack: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<AttendancesCubit>().getAttendances();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0.h),
          child: BlocBuilder<AttendancesCubit, AttendancesState>(
            builder: (context, state) {
              final cubit = AttendancesCubit.get(context);
              return ConditionalBuilder(
                condition: state is AttendancesErrorState,
                builder: (context) => // error
                    Center(
                  child: Center(
                    child: FailureWidget(
                      message: (state as AttendancesErrorState).message,
                      onRetry: () {
                        cubit.getAttendances();
                      },
                    ),
                  ),
                ),
                fallback: (context) => ConditionalBuilder(
                  condition: state is AttendancesLoadingState,
                  builder: (context) => const ListViewLoadingWidget(),
                  fallback: (context) => ConditionalBuilder(
                    condition: cubit.attendances.isEmpty,
                    builder: (context) => Expanded(
                      child: Center(
                        child: Text(
                          'لا يوجد حضور بعد',
                          style: AppTextStyle.black_18BOLD.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    fallback: (context) => ListView.separated(
                      itemCount: cubit.attendances.length,
                      itemBuilder: (context, index) {
                        AttendanceEntity? attendanceEntity =
                            cubit.attendances[index];
                        return AttendanceItem(
                          attendanceEntity: attendanceEntity,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 15.h,
                      ),
                    ),
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

class AttendanceItem extends StatelessWidget {
  const AttendanceItem({
    super.key,
    required this.attendanceEntity,
  });

  final AttendanceEntity? attendanceEntity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomListTileCard(
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              attendanceEntity?.title ?? '',
              style: AppTextStyle.black_18BOLD.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 0.5.sw,
              child: Text(
                'وقت الحضور :  ${attendanceEntity?.time ?? ''}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.grey_18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                  color: const Color(0XFFF97D04),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                attendanceEntity?.type ?? '',
                style: AppTextStyle.white_15BOLD,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              attendanceEntity?.date ?? '',
              style: AppTextStyle.grey_18.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}
