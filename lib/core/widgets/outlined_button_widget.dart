import 'package:zone/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/color_manager.dart';

class OutlineButtonWidget extends StatelessWidget {
  final Color? color;
  final String? title;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final ButtonStyle? style;
  const OutlineButtonWidget({
    super.key,
    this.title,
    this.height,
    this.width,
    this.color,
    this.onPressed,
    this.style,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: height ?? 0.08.sh,
          maxWidth: width ?? 0.8.sw,
        ),
        width: width ?? 0.8.sw,
        height: height ?? 0.08.sh,
        child: OutlinedButton(
          onPressed: onPressed,
          style: style,
          child: Text(
            title ?? '',
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
