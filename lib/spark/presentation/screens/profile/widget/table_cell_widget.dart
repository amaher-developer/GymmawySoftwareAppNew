import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/text_styles.dart';
import '../../../../../core/managers/color_manager.dart';

class ProfileTableCellWidget extends StatelessWidget {
  final bool leftCell;
  final String cellTitle;
  final String cellValue;
  final double? top;

  const ProfileTableCellWidget({
    required this.leftCell,
    required this.cellTitle,
    required this.cellValue,
    this.top,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftCell ? .12.sw : null,
      right: leftCell ? null : .12.sw,
      top: top,
      child: Column(
        children: [
          Text(
            cellTitle,
            style: AppTextStyle.main_24.copyWith(
              fontWeight: FontWeight.bold,
              color: LightColors.primary,
              fontSize: 18.sp,
            ),
          ),
          Text(
            cellValue,
            textDirection: TextDirection.rtl,
            style: AppTextStyle.grey_18
                .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
