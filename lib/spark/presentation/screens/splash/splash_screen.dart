import 'dart:async';

import 'package:zone/core/helper/user_helper.dart';
import 'package:zone/core/managers/route_manager.dart';
import 'package:zone/main.dart';
import 'package:zone/spark/presentation/cubit/splash/splash_cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/managers/asset_manager.dart';
import '../../../../core/managers/color_manager.dart';
import '../../cubit/login/login_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      if (await UserHelper.isUserLoggedIn()) {
        BlocProvider.of<LoginCubit>(navigatorKey.currentContext!)
            .initUser(UserHelper.getUser());
        Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
          Routes.mainLayout,
          (route) => false,
        );
        return;
      } else if (UserHelper.getGuestData()?.phone != null) {
        Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
          Routes.mainLayout,
          (route) => false,
        );
        return;
      } else if (UserHelper.getIsGuest() == true) {
        Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
          Routes.mainLayout,
          (route) => false,
        );
        return;
      }
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
        Routes.login,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        final cubit = BlocProvider.of<SplashCubit>(context);
        if (cubit.splashEntity?.isExpired == 1) {
          UserHelper.logout();
          /* Navigator.pushNamedAndRemoveUntil(
              context, Routes.initial, (route) => false);*/
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SvgPicture.asset(
            LogoManager.svgLogo,
            //color: LightColors.primary,
            height: 0.30.sh,
          ),
        ),
      ),
    );
  }
}
