import 'package:zone/core/extensions/translation_extinsions.dart';
import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/core/managers/route_manager.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/core/widgets/conditional_builder.dart';
import 'package:zone/main.dart';
import 'package:zone/spark/presentation/cubit/gallery/gallery_cubit.dart';
import 'package:zone/spark/presentation/cubit/home/home_cubit.dart';
import 'package:zone/spark/presentation/cubit/profile/profile_cubit.dart';
import 'package:zone/spark/presentation/cubit/profile/profile_state.dart';
import 'package:zone/spark/presentation/cubit/subscriptions/subscriptions_cubit.dart';
import 'package:zone/spark/presentation/screens/profile/widget/buttons_row_widget.dart';
import 'package:zone/spark/presentation/screens/profile/widget/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/consts/text_styles.dart';
import '../../../../core/helper/user_helper.dart';
import '../../../../core/widgets/failure_widget.dart';
import '../../../../core/widgets/outlined_button_widget.dart';
import '../../../../core/widgets/rounder_container.dart';
import '../../cubit/shared/shared_cubit.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColors.primary,
        systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: LightColors.primary),
        elevation: 0,
        title: Text(
          StringsAssetsConstants.my_account,
          style: AppTextStyle.white_20.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print('objectttttttttttt');
          final cubit = ProfileCubit.get(context);

/*          UserHelper.getUserToken() == null
              ? Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.login);
              },
              child: Text(
                StringsAssetsConstants.login_to_continue,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          )
              :*/
          return ConditionalBuilder(
            condition: UserHelper.getUserToken() == null,
            builder: (context) => Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(Routes.login);
                },
                child: Text(
                  StringsAssetsConstants.login_to_continue,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            fallback: (context) => ConditionalBuilder(
              condition: state is ErrorProfileStates,
              builder: (context) => Center(
                child: FailureWidget(
                  message: 'لا يوجد اتصال بالانترنت',
                  onRetry: () {
                    cubit.getProfileData();
                  },
                ),
              ),
              fallback: (context) => RefreshIndicator(
                onRefresh: () async {
                  ProfileCubit.get(context).getProfileData();
                },
                child: SingleChildScrollView(
                  child: BlocConsumer<ProfileCubit, ProfileStates>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      final cubit = ProfileCubit.get(context);
                      return Column(
                        children: [
                          SizedBox(
                            height: 170,
                            child: Stack(
                              children: [
                                Container(
                                  height: 100,
                                  decoration: const BoxDecoration(
                                      color: LightColors.primary,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(50))),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: .35.sw,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: .30.sw, //.30.sw,
                                        height: 140, // .20.sh,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.fromBorderSide(
                                            BorderSide(
                                                color: Colors.white
                                                    .withOpacity(.2),
                                                width: 15,
                                                style: BorderStyle.solid,
                                                strokeAlign: BorderSide
                                                    .strokeAlignOutside),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(cubit
                                                .member?.image ??
                                                'https://www.pngitem.com/pimgs/m/404-4042710_circle-profile-picture-png-transparent-png.png'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  cubit.member?.name ?? '',
                                  style: AppTextStyle.black_18BOLD
                                      .copyWith(fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                            child: Text(
                              cubit.member?.phone ?? '',
                              style: AppTextStyle.black_18BOLD
                                  .copyWith(fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Image.network(cubit.member?.codeUrl ?? 'https://kythara.gymmawy.com/uploads/qrcodes/000000000315.png') /*Image.asset(
                                    IconManager.barCode,
                                    width: 25.w,
                                    height: 25.w,
                                    color: Colors.teal.withOpacity(.7),
                                  )*/,
                                )
                              ],
                            ),
                          ),Container(
                            child: Text(
                              cubit.member?.code ?? '',
                              style: AppTextStyle.black_18BOLD
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ProfileButtonsRowWidget(
                            leftButtonText:
                            StringsAssetsConstants.training_classes,
                            rightButtonText:
                            StringsAssetsConstants.attendance_classes,
                            onLeftButtonTapped: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.trainingSessions);
                            },
                            onRightButtonTapped: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.attendanceSessions);
                            },
                            backgroundColor: const Color(0XFF23232F),
                            textStyle: AppTextStyle.white_17
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15.h),
                          ProfileButtonsRowWidget(
                            leftButtonText:
                            StringsAssetsConstants.training_system,
                            rightButtonText: StringsAssetsConstants.tracking,
                            onLeftButtonTapped: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.trainingAndDietsPrograms);
                            },
                            onRightButtonTapped: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.followingUp);
                            },
                            backgroundColor: const Color(0XFF23232F),
                            textStyle: AppTextStyle.white_17
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15.h),
                          OutlineButtonWidget(
                            title: cubit.member?.subscriptionName ??
                                StringsAssetsConstants.subscriptions,
                            color: LightColors.primary,
                            textStyle: AppTextStyle.white_17,
                            width: 0.85.sw,
                            height: 0.07.sh,
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  Routes.subscriptionDetails,
                                  arguments: {
                                    'selectedActivityId':
                                    cubit.member?.subscriptionId
                                  });
                            },
                          ),
                          SizedBox(height: 20.h),
                          ProfileTableWidget(
                            amountPaid: cubit.member?.amountPaid,
                            amountRemaining: cubit.member?.amountRemaining,
                            startDate: cubit.member?.joiningDate,
                            endDate: cubit.member?.expireDate,
                            attendance: cubit.member?.attendeesCount,
                            membershipStatus: cubit.member?.membershipStatus,
                            freezeCheck: cubit.member?.freezeCheck,
                          ),

                          ProfileButtonsRowWidget(
                            leftButtonText: 'English',
                            rightButtonText: StringsAssetsConstants.arabic_lang,
                            backgroundColor: Colors.transparent,
                            isWithRadio: true,
                            textStyle: AppTextStyle.black_18BOLD.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            onLeftButtonTapped: () {
                              SharedCubit.get(context)
                                  .changlang(context, 'en')
                                  .then(
                                    (value) {
                                  UserHelper.setLanguage(languageCode: 'en');
                                  HomeCubit.get(context).getHomeData();
                                  SubscriptionsCubit.get(context)
                                      .getSubscriptions();
                                  GalleryCubit.get(context).getGalleryImages();
                                  ProfileCubit.get(context)
                                      .getProfileData()
                                      .then((value) {
                                    setState(() {});
                                  });

                                  /*      Navigator.of(context).pushNamed(Routes.initial);*/
                                },
                              );
                            },
                            onRightButtonTapped: () {
                              SharedCubit.get(context)
                                  .changlang(context, 'ar')
                                  .then((value) {
                                UserHelper.setLanguage(languageCode: 'ar');
                                HomeCubit.get(context).getHomeData();
                                SubscriptionsCubit.get(context)
                                    .getSubscriptions();
                                GalleryCubit.get(context).getGalleryImages();
                                ProfileCubit.get(context)
                                    .getProfileData()
                                    .then((value) {
                                  setState(() {});
                                });
                              });
                            },
                          ),

                          SizedBox(height: 15.h),
                          RoundedContainer(
                            backgroundColor: Colors.transparent,
                            borderColor: LightColors.red,
                            width: .85.sw,
                            height: 70.h,
                            alignment: Alignment.center,
                            child: Text(
                              StringsAssetsConstants.logout,
                              style: AppTextStyle.white_22.copyWith(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                            onTapped: () {
                              UserHelper.clearUser();
                              Navigator.of(navigatorKey.currentContext!)
                                  .pushReplacementNamed(Routes.initial);
                            },
                          ),
                          SizedBox(height: 10.h),

                          Container(
                            alignment: Alignment.center,
                            child:  InkWell(
                              child: Text(
                                cubit.member?.freezeCheck == 1 ? "freeze_subscription".translated : "",
                                style: AppTextStyle.white_22.copyWith(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                              onTap: () {
                                // TODO: implement freeze account
                                // confirm freeze account Dialog
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor:Colors.white,
                                        title: Text(
                                          'freeze_subscription'.translated,
                                          style: AppTextStyle.black_18BOLD
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                        content: Text(
                                          'are_you_sure_to_freeze_subscription'.translated,
                                          style: AppTextStyle.black_16,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'no'.translated,
                                              style: AppTextStyle.black_18BOLD
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              cubit.freezeAccount()
                                                  .then((value) {

                                                // if (state
                                                // is FreezeAccountSuccessStates) {

                                                // note: we need to refresh the page to get new status


                                                //}
                                              });
                                            },
                                            child: Text(
                                              'yes'.translated,
                                              style: AppTextStyle.black_18BOLD
                                                  .copyWith(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Text(
                                StringsAssetsConstants.delete_account,
                                style: AppTextStyle.white_22.copyWith(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                              onTap: () {
                                // TODO: implement delete account
                                // confirm delete account Dialog
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor:Colors.white,
                                        title: Text(
                                          'delete_account'.translated,
                                          style: AppTextStyle.black_18BOLD
                                              .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                        content: Text(
                                          'are_you_sure_to_delete_account'.translated,
                                          style: AppTextStyle.black_16,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'no'.translated,
                                              style: AppTextStyle.black_18BOLD
                                                  .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              cubit
                                                  .deleteAccount()
                                                  .then((value) {
                                                print('state is $state');
                                                if (state
                                                is DeleteAccountSuccessStates) {
                                                  UserHelper.clearUser();
                                                  Navigator.of(navigatorKey
                                                      .currentContext!)
                                                      .pushReplacementNamed(
                                                      Routes.initial);
                                                }
                                              });
                                            },
                                            child: Text(
                                              'yes'.translated,
                                              style: AppTextStyle.black_18BOLD
                                                  .copyWith(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}