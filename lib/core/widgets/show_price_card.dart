import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/text_styles.dart';
import '../managers/color_manager.dart';

class ShowPriceButton extends StatelessWidget {
  const ShowPriceButton({
    super.key,
    this.price,
  });

  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: LightColors.primary.withOpacity(0.05),
              border: Border.all(color: LightColors.primary, width: 1.5.r)),
          padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 18.r),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                CupertinoIcons.money_dollar_circle,
                color: LightColors.primary,
                size: 30.r,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                price ?? '300 جنية',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.black_18BOLD.copyWith(
                  fontSize: 17,
                  color: LightColors.primary,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
