import 'package:zone/spark/presentation/cubit/home/home_cubit.dart';
import 'package:zone/spark/presentation/cubit/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/managers/color_manager.dart';

class NotificationWidget extends StatelessWidget {
  final Color? backgroundColor;

  final double width, height;
  final double iconSize;
  final Color? backIconColor;
  final VoidCallback? onPressed;

  const NotificationWidget({
    Key? key,
    this.height = 34,
    this.iconSize = 20,
    this.backgroundColor,
    this.backIconColor,
    this.onPressed,
    this.width = 34,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.w,
      decoration: BoxDecoration(
        color: backgroundColor ?? LightColors.lightGreen,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          foregroundColor: LightColors.primary,
        ),
        onPressed: onPressed,
        child: BlocBuilder<HomeCubit, HomeStates>(
          buildWhen: (previous, current) => current is UpdateState,
          builder: (context, state) {
            final homeCubit = HomeCubit.get(context);
            return Stack(children: [
              Icon(
                Icons.notifications_none_outlined,
                color: backIconColor ?? LightColors.white,
                size: iconSize.sp,
              ),
              if (homeCubit.homeEntity?.isNewNotifications != 0 &&
                  homeCubit.homeEntity?.isNewNotifications != null)
                Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: Container(
                    width: 12.w,
                    height: 12.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: LightColors.notificationColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
            ]);
          },
        ),
      ),
    );
  }
}
