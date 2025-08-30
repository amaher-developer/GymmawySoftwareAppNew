import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/color_manager.dart';

class RoundedContainer extends StatelessWidget {
  RoundedContainer({
    super.key,
    this.child,
    this.backgroundColor,
    this.onTapped,
    this.radius,
    this.constraints,
    this.borderColor,
    this.height,
    this.width,
    this.alignment,
    this.padding,
    this.borderWidth,
    this.withBorder,
    this.boxShadow,
  });

  final VoidCallback? onTapped;
  final Color? borderColor;
  final double? radius;
  final Color? backgroundColor;
  final Widget? child;
  bool? withBorder;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  BoxConstraints? constraints;
  double? height;
  double? width;
  double? borderWidth;
  List<BoxShadow>? boxShadow;

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
            boxShadow: boxShadow,
            color: backgroundColor ?? LightColors.primary,
            borderRadius: BorderRadius.circular(radius ?? 20.r),
            border: withBorder == true
                ? Border.all(
                    color: borderColor ?? LightColors.primary,
                    width: borderWidth ?? 0,
                  )
                : null),
        child: child,
      ),
    );
  }
}
