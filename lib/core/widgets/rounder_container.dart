import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/color_manager.dart';

class RoundedContainer extends StatelessWidget {
  RoundedContainer({
    super.key,
    this.child,
    this.backgroundColor,
    this.borderColor,
    this.onTapped,
    this.radius,
    this.constraints,
    this.height,
    this.borderWidth,
    this.width,
    this.alignment,
    this.padding,
  });

  final VoidCallback? onTapped;
  final double? radius;
  final double? borderWidth;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  BoxConstraints? constraints;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        padding: padding,
        alignment: alignment,
        height: height,
        width: width,
        constraints: constraints,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? LightColors.primary,
            width: borderWidth ?? 1.0,
          ),
          color: backgroundColor ?? LightColors.primary,
          borderRadius: BorderRadius.circular(radius ?? 12.r),
        ),
        child: child,
      ),
    );
  }
}
