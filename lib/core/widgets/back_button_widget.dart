import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/color_manager.dart';

class BackButtonWidget extends StatelessWidget {
  final Color? backgroundColor;

  final double width, height;
  final double iconSize;
  final Color? backIconColor;
  const BackButtonWidget({
    Key? key,
    this.height = 34,
    this.iconSize = 20,
    this.backgroundColor,
    this.backIconColor,
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.transparent,
          foregroundColor: LightColors.primary,
        ),
        onPressed: () => Navigator.of(context).pop(),
        child: Center(
          child: Icon(
            Icons.arrow_forward,
            color: backIconColor ?? LightColors.white,
            size: iconSize.sp,
          ),
        ),
      ),
    );
  }
}
