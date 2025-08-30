import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/rounded_container.dart';

class ProfileButtonsRowWidget extends StatelessWidget {
  final String leftButtonText;
  final String rightButtonText;
  final TextStyle textStyle;

  final Color backgroundColor;
  final bool? isWithRadio;
  String selectedLanguage = currentLanguage;
  final Function()? onLeftButtonTapped;
  final Function()? onRightButtonTapped;

  ProfileButtonsRowWidget({
    required this.leftButtonText,
    required this.rightButtonText,
    required this.backgroundColor,
    required this.textStyle,
    this.onRightButtonTapped,
    this.onLeftButtonTapped,
    this.isWithRadio,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .9.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedContainer(
            borderWidth: 2.r,
            withBorder: isWithRadio != null,
            radius: 10.r,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            borderColor:
                selectedLanguage == 'en' ? LightColors.primary : Colors.grey,
            backgroundColor: backgroundColor,
            width: 0.42.sw,
            alignment: Alignment.center,
            onTapped: onLeftButtonTapped,
            child: isWithRadio == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        leftButtonText,
                        style: textStyle,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      const Icon(Icons.flag),
                      Radio(
                        activeColor: currentLanguage == 'en'
                            ? LightColors.primary
                            : Colors.grey,

                        value: 0,
                        groupValue: 0,

                        //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        onChanged: (value) {
                          selectedLanguage = 'en';
                        },
                      )
                    ],
                  )
                : Text(
                    leftButtonText,
                    style: textStyle,
                  ),
          ),
          RoundedContainer(
            withBorder: isWithRadio != null,
            borderWidth: 2.r,
            radius: 10.r,
            borderColor:
                selectedLanguage == 'ar' ? LightColors.primary : Colors.grey,
            backgroundColor: backgroundColor,
            width: 0.42.sw,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
            onTapped: onRightButtonTapped,
            child: isWithRadio != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rightButtonText,
                        style: textStyle.copyWith(height: 1),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      const Icon(Icons.flag),
                      Radio(
                        activeColor: selectedLanguage == 'ar'
                            ? LightColors.primary
                            : Colors.grey,
                        value: 1,
                        groupValue: 1,
                        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        onChanged: (value) {
                          selectedLanguage = 'ar';
                        },
                      )
                    ],
                  )
                : Text(
                    rightButtonText,
                    style: textStyle,
                  ),
          ),
        ],
      ),
    );
  }
}
