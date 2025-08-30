import 'package:zone/core/consts/text_styles.dart';
import 'package:flutter/material.dart';

import '../managers/color_manager.dart';

class AppInputStyle {
  static InputDecoration textFieldDecoration(
      {String? hintText,
      String? labelText,
      Widget? prefixIcon,
      Widget? suffixIcon,
      String? errorText,
      bool? filled}) {
    filled = filled ?? true;
    return InputDecoration(
      fillColor: LightColors.grey.withAlpha(50),
      filled: filled,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintText: hintText,
      labelText: !filled ? labelText : null,
      hintStyle: AppTextStyle.grey_14point5,
      labelStyle: AppTextStyle.black_14Point5
          .copyWith(color: Colors.transparent), // to remove lable color

      // helperText:helperText==null||helperText==""?null:helperText,
      helperStyle: AppTextStyle.black_13.copyWith(color: LightColors.red),
      errorText: errorText == null || errorText == "" ? null : errorText,
      errorStyle: AppTextStyle.black_13.copyWith(color: LightColors.red),
      contentPadding:
          const EdgeInsets.only(top: 16, bottom: 16, left: 12, right: 12),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: LightColors.black),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: LightColors.grey.withAlpha(50),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(color: LightColors.black),
      ),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: LightColors.grey.withAlpha(50),
          )),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.red)),
    );
  }
}
