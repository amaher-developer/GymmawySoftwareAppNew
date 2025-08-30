import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/color_manager.dart';


class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double height;
  final double width;
  final double textSize;
  final double padding;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final bool capitalize;
  final bool hasBorderRadius;
  final IconData? icon;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.height = 40.0,
    required this.width,
    this.borderRadius = 10.0,
    this.padding = 8.0,
    this.backgroundColor = LightColors.white,
    this.capitalize = false,
    this.textSize = 18.0,
    this.textColor = LightColors.white,
    this.hasBorderRadius = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: icon == null
          ? ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  onPressed != null ? backgroundColor : LightColors.grey,
                ),
                shape: hasBorderRadius
                    ? MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius.r),
                        ),
                      )
                    : MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                      ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(padding),
                ),
              ),
              child: Text(
                capitalize ? text.toUpperCase() : text,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize.sp,
                ),
              ),
            )
          : ElevatedButton.icon(
              icon: Icon(
                icon,
                color: textColor,
              ),
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                shape: hasBorderRadius
                    ? MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius.r),
                        ),
                      )
                    : MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                      ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.all(padding),
                ),
              ),
              label: Text(
                capitalize ? text.toUpperCase() : text,
                style: TextStyle(
                  color: textColor,
                  fontSize: textSize.sp,
                ),
              ),
            ),
    );
  }
}
