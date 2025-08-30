import 'package:zone/core/consts/text_styles.dart';
import 'package:zone/core/helper/user_helper.dart';
import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/spark/presentation/cubit/main_layout/states.dart';
import 'package:zone/spark/presentation/screens/gallery/gallery_screen.dart';
import 'package:zone/spark/presentation/screens/home/home_screen.dart';
import 'package:zone/spark/presentation/screens/profile/profile_screen.dart';
import 'package:zone/spark/presentation/screens/register/register_screen.dart';
import 'package:zone/spark/presentation/screens/subscriptions/subscriptions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/services/server_messaging.dart';
import '../../../../core/widgets/keep_alive_widget.dart';
import '../../../../main.dart';
import '../../cubit/home/home_cubit.dart';
import '../../cubit/main_layout/cubit.dart';

class MainLayout extends StatefulWidget {
  MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List screens = [
    const HomeScreen(),
    const SubscriptionsScreen(),
    const GalleryScreen(),
    UserHelper.getUserToken() == null
        ? const RegisterScreen(
            fromProfile: false,
          )
        : const ProfileScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ServerMessaging.onTerminatedMessageSent(callBack: () {
        HomeCubit.get(navigatorKey.currentContext!).getHomeData();
      });
      ServerMessaging.onForeGroundMessagingSent(callBack: () {
        HomeCubit.get(navigatorKey.currentContext!).getHomeData();
      });
    });

    ServerMessaging.onBackGroundMessagingSent(callBack: () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit, MainLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = MainLayoutCubit.get(context);

        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: cubit.pageController,
            onPageChanged: (index) => cubit.currentIndex = index,
            children:
                screens.map((view) => KeepAliveWidget(child: view)).toList(),
          ),
          bottomNavigationBar: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: LightColors.primary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, -5),
                  blurRadius: 20,
                  color: LightColors.primary.withOpacity(0.09),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: SafeArea(
              top: false,
              child: SalomonBottomBar(
                itemPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(
                      Icons.home_filled,
                    ),
                    title: Text(
                      StringsAssetsConstants.home,
                      style: AppTextStyle.white_15.copyWith(height: 1.0),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      Icons.monetization_on_outlined,
                    ),
                    title: Text(
                      StringsAssetsConstants.memberships,
                      style: AppTextStyle.white_15.copyWith(height: 1.0),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      Icons.image,
                    ),
                    title: Text(
                      StringsAssetsConstants.gallery_photos,
                      style: AppTextStyle.white_15.copyWith(height: 1.0),
                    ),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(
                      Icons.account_circle_outlined,
                    ),
                    title: Text(
                      StringsAssetsConstants.profile,
                      style: AppTextStyle.white_15.copyWith(height: 1.0),
                    ),
                  ),
                ],
                onTap: (value) {
                  cubit.changeIndex(index: value);
                  //    cubit.changeIndex(index: value);
                },
                selectedItemColor: LightColors.white,
                unselectedItemColor: LightColors.white.withOpacity(.5),
                currentIndex: cubit.currentIndex,
              ),
            ),
          ),
        );
      },
    );
  }
}
