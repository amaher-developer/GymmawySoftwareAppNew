import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/text_styles.dart';

class HeaderAndValueWidget extends StatelessWidget {
  const HeaderAndValueWidget({
    super.key,
    this.header,
    this.value,
    this.headerStyle,
    this.valueStyle,
    this.headerHeight,
    this.valueHeight,
    this.valueColor,
    this.headerColor,
  });

  final String? header;
  final String? value;
  final TextStyle? headerStyle;
  final TextStyle? valueStyle;
  final double? headerHeight;
  final double? valueHeight;
  final Color? valueColor;
  final Color? headerColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: headerHeight ?? 40.h,
          width: 100.w,
          child: FittedBox(
            child: Text(
              header ?? 'عدد التدريبات',
              style: headerStyle ??
                  AppTextStyle.white_20.copyWith(
                    fontWeight: FontWeight.bold,
                    color: headerColor ?? Colors.white,
                  ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: valueHeight ?? 40.h,
          width: 100.w,
          child: FittedBox(
            child: Text(
              value ?? '300',
              style: valueStyle ??
                  AppTextStyle.white_20.copyWith(
                    fontWeight: FontWeight.bold,
                    color: valueColor ?? Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
