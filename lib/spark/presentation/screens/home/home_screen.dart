import 'package:zone/core/helper/user_helper.dart';
import 'package:zone/core/managers/route_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/conditional_builder.dart';
import 'package:zone/core/widgets/failure_widget.dart';
import 'package:zone/spark/presentation/cubit/home/home_cubit.dart';
import 'package:zone/spark/presentation/cubit/home/home_state.dart';
import 'package:zone/spark/presentation/screens/home/widgets/home_announcments.dart';
import 'package:zone/spark/presentation/screens/home/widgets/home_contact_card.dart';
import 'package:zone/spark/presentation/screens/home/widgets/home_slides.dart';
import 'package:zone/spark/presentation/screens/home/widgets/home_titled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/services/dialogs.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../cubit/main_layout/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainLayoutCubit = MainLayoutCubit.get(context);
    final cubit = HomeCubit.get(context)..initPermission();
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        forceUpdateDialog();
        if (state is UpdateState) {}
        if (cubit.homeEntity?.isExpired == 1) {
          UserHelper.logout();
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.initial, (route) => false);
        }
      },
      buildWhen: (previous, current) {
        if (current != const UpdateState()) {
          return true;
        }
        if (previous is SuccessHomeState && current is UpdateState) {
          cubit.getHomeData();
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is ErrorHomeState,
          builder: (context) => Scaffold(
            body: Center(
              child: FailureWidget(
                message: StringsAssetsConstants.error_try_again,
                onRetry: () {
                  cubit.getHomeData();
                },
              ),
            ),
          ),
          fallback: (context) => ConditionalBuilder(
            condition: state is LoadingHomeState,
            builder: (context) => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            fallback: (context) => ConditionalBuilder(
              condition: state is SuccessHomeState,
              builder: (context) => RefreshIndicator(
                onRefresh: () async {
                  await HomeCubit.get(context).getHomeData();
                },
                child: Scaffold(
                  backgroundColor: LightColors.white,
                  appBar: HeaderWidget(
                    banners: cubit.homeEntity?.banners,
                    title: cubit.homeEntity?.welcomeMember?.trim(),
                    titleFontSize: 20.sp,
                    subTitle: cubit.homeEntity?.welcomeMessage?.trim(),
                    backgroundColor: LightColors.primary,
                    isWithImage: true,
                    serverImageLink:
                        'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                    isBack: false,
                    anotherWidget: true,
                    appBarHeight: 85.h,
                  ),
                  body: SafeArea(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: ListView(
                        children: [
                          HomeAnnouncements(
                            onTap: (int selectedBannerId, int type) {
                              Navigator.pushNamed(
                                context,
                                Routes.offers,
                                arguments: {
                                  'id': selectedBannerId,
                                  'type': type,
                                },
                              );
                            },
                            banners: cubit.homeEntity?.banners,
                          ),

                          if (cubit.homeEntity?.phones?.isNotEmpty ?? false)
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 15.w,
                                  left: 15.w,
                                  top: 10.h,
                                  bottom: 15.h),
                              child: HomeContactUsCard(
                                firstNumber: cubit.homeEntity?.phones?[0],
                                secondNumber:
                                    ((cubit.homeEntity?.phones?.length ?? 1) >
                                            1)
                                        ? cubit.homeEntity?.phones![1]
                                        : null,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.contactUs);
                                },
                              ),
                            ),


                          /// subscriptions
                          if ((cubit.homeEntity?.subscriptions?.isNotEmpty ??
                              false) &&
                              cubit.homeEntity?.subscriptions != null)
                            HomeTitled(
                              title: StringsAssetsConstants.subscriptions,
                              showMoreAction: () {
                                mainLayoutCubit.changeIndex(index: 1);
                              },
                            ),
                          if ((cubit.homeEntity?.subscriptions?.isNotEmpty ??
                              false) &&
                              cubit.homeEntity?.subscriptions != null)
                            MoreSlidesWidget(
                              isOffer: true,
                              subscriptions: cubit.homeEntity?.subscriptions,
                              height: .17.sh,
                              subscriptionWidth: .30.sw,
                              getIdCallback: (int selectedActivityId) {
                                Navigator.pushNamed(
                                    context, Routes.subscriptionDetails,
                                    arguments: {
                                      'selectedActivityId': selectedActivityId
                                    });
                              },
                            ),
                          if ((cubit.homeEntity?.subscriptions?.isNotEmpty ??
                              false) &&
                              cubit.homeEntity?.subscriptions != null)
                            SizedBox(height: 15.h),


                          if ((cubit.homeEntity?.activities?.isNotEmpty ??
                                  false) &&
                              cubit.homeEntity?.activities != null)
                            HomeTitled(
                              title: StringsAssetsConstants.activities,
                              showMoreAction: () {
                                Navigator.pushNamed(context, Routes.activity);
                              },
                            ),

                          /// activities
                          if ((cubit.homeEntity?.trainings?.isNotEmpty ??
                                  false) &&
                              cubit.homeEntity?.trainings != null)
                            SizedBox(height: 10.h),
                          if ((cubit.homeEntity?.activities?.isNotEmpty ??
                                  false) &&
                              cubit.homeEntity?.activities != null)
                            MoreSlidesWidget(
                              itemHeight: 0.16.sh,
                              priceBackgroundColor:
                                  Colors.black.withOpacity(0.5),
                              getIdCallback: (int selectedActivityId) {
                                Navigator.pushNamed(
                                    context, Routes.activityDetails,
                                    arguments: {'id': selectedActivityId});
                              },
                              model: cubit.homeEntity?.activities,
                              width: 0.33.sw,
                              height: 0.22.sh,
                            ),
                          if ((cubit.homeEntity?.activities?.isNotEmpty ??
                                  false) &&
                              cubit.homeEntity?.activities != null)
                            SizedBox(height: 10.h),

                          ///Available Trainings
                          if ((cubit.homeEntity?.subscriptions?.isNotEmpty ??
                              false) &&
                              cubit.homeEntity?.subscriptions != null)
                            SizedBox(height: 10.h),
                          if ((cubit.homeEntity?.trainings?.isNotEmpty ??
                              false) &&
                              cubit.homeEntity?.trainings != null)
                            HomeTitled(
                              title: StringsAssetsConstants.trainings,
                              showMoreAction: () {
                                Navigator.pushNamed(
                                    context, Routes.availableTrainings);
                              },
                            ),
                          if ((cubit.homeEntity?.trainings?.isNotEmpty ??
                              false) &&
                              cubit.homeEntity?.trainings != null)
                            MoreSlidesWidget(
                              itemHeight: 0.16.sh,
                              priceBackgroundColor:
                              Colors.black.withOpacity(0.5),
                              getIdCallback: (int selectedTrainingId) {
                                Navigator.pushNamed(
                                    context, Routes.availableTrainingDetails,
                                    arguments: {'id': selectedTrainingId});
                              },
                              model: cubit.homeEntity?.trainings,
                              height: 0.22.sh,
                              width: 0.55.sw,
                            ),
                          if ((cubit.homeEntity?.trainings?.isNotEmpty ??
                              false) &&
                              cubit.homeEntity?.trainings != null)
                            SizedBox(height: 15.h),

                          /// stores
                          if ((cubit.homeEntity?.stores?.isNotEmpty ?? false) &&
                              cubit.homeEntity?.stores != null)
                            HomeTitled(
                              title: StringsAssetsConstants.store,
                              showMoreAction: () {
                                Navigator.pushNamed(context, Routes.shopping);
                              },
                            ),

                          if ((cubit.homeEntity?.stores?.isNotEmpty ?? false) &&
                              cubit.homeEntity?.stores != null)
                            SizedBox(height: 10.h),
                          if ((cubit.homeEntity?.stores?.isNotEmpty ?? false) &&
                              cubit.homeEntity?.stores != null)
                            MoreSlidesWidget(
                              imageFit: BoxFit.contain,
                              itemHeight: 0.17.sh,
                              backGroundColor: Colors.white,
                              padding: EdgeInsets.all(15.r),
                              priceBackgroundColor:
                                  Colors.black.withOpacity(0.5),
                              getIdCallback: (int selectedStoreId) {
                                Navigator.pushNamed(
                                    context, Routes.shoppingDetails,
                                    arguments: {'id': selectedStoreId});
                              },
                              model: cubit.homeEntity?.stores,
                              width: 0.33.sw,
                              height: 0.22.sh,
                            ),
                          if ((cubit.homeEntity?.stores?.isNotEmpty ?? false) &&
                              cubit.homeEntity?.stores != null)
                            SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              fallback: (context) => Scaffold(
                body: Center(
                    child: ErrorWidget(
                  'Something went wrong',
                )),
              ),
            ),
          ),
        );
      },
    );
  }
}
