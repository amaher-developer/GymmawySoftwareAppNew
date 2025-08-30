import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/consts/text_styles.dart';
import '../../../../../core/managers/color_manager.dart';

class AttatchmentWidget extends StatelessWidget {
  const AttatchmentWidget({
    super.key,
    this.onTap,
    this.iconData,
    this.title,
  });
  final VoidCallback? onTap;
  final IconData? iconData;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 0.05.sh,
            width: 0.05.sh,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: LightColors.primary,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(
              iconData ?? Icons.link,
              color: LightColors.white.withOpacity(0.8),
              size: 25.r,
            ),
          ),
          SizedBox(width: 0.05.sw),
          Expanded(
            child: Text(
              title ?? '',
              style: AppTextStyle.white_19.copyWith(
                color: LightColors.textColor.withOpacity(0.6),
                height: 1.4,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
