import 'package:zone/core/extensions/translation_extinsions.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/utils/utils.dart';
import 'package:zone/core/widgets/activity_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/route_manager.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../cubit/activites/all_activites/activities_cubit.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        isBack: true,
        title: "activities".translated,
        isWithImage: false,
        titleFontSize: 20.sp,
        appBarHeight: 79.h,
        textColor: LightColors.black,
        backButtonBackgroundColor: LightColors.black,
        backgroundColor: LightColors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(9.0.r),
        child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
          builder: (context, state) {
            if (state is ActivitiesLoadingState) {
              return showLoadingIndicator();
            }
            if (state is ActivitiesSuccessState) {
              return SizedBox(
                height: 0.95.sh,
                child: GridView.builder(
                  // Set padding and spacing between cards.
                  padding: EdgeInsets.all(10.r),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // Set the aspect ratio of each card.
                    childAspectRatio: 0.8.r,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                  ),
                  // Set the number of items in the grid view.
                  itemCount: state.activities.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Build each card in the grid view.
                    return ShardCardItem(
                      getIdCallback: (int selectedActivityId) {
                        Navigator.of(context).pushNamed(Routes.activityDetails,
                            arguments: {'id': selectedActivityId});
                      },
                      imgUrl: state.activities[index].image,
                      price: state.activities[index].price,
                      activityTitle: state.activities[index].name,
                      id: state.activities[index].id,
                    );
                  },
                  // Set the grid view to shrink wrap its contents.
                  shrinkWrap: true,
                ),
              );
            }
            return Center(
              child: Text(StringsAssetsConstants.unknown_error),
            );
          },
        ),
      ),
    );
  }
}
