import 'package:zone/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';
import 'size_manager.dart';

class ThemeManager {
  static ThemeData get lightTheme {
    return ThemeData(
      textTheme: TextTheme(
        titleLarge: AppTextStyle.black_18BOLD,
        displayLarge: AppTextStyle.black_18BOLD,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColors.backgroundLight,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: LightColors.backgroundLight,
        iconTheme: IconThemeData(
          color: LightColors.white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(
          12.r,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        side: BorderSide(
          width: 2.w,
          color: LightColors.white,
        ),
        textStyle: AppTextStyle.black_18BOLD,
        backgroundColor: LightColors.primary,
        foregroundColor: LightColors.primary,
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightColors.white,
          padding: const EdgeInsets.all(
            AppPadding.padding16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppRadius.radius24,
            ),
          ),
          textStyle: const TextStyle(
            color: LightColors.black,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          borderSide: const BorderSide(
            color: LightColors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          borderSide: const BorderSide(
            color: LightColors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          borderSide: const BorderSide(
            color: LightColors.black,
          ),
        ),
      ),
      primaryColor: LightColors.primary,
      // primaryColorLight: LightColors.primaryLight,
      // primaryColorDark: LightColors.primaryDark,
      extensions: const <ThemeExtension<dynamic>>[
        ColorsStyles(
          backgroundColor: LightColors.backgroundLight,
          textColor: LightColors.backgroundLight,
          disableColor: LightColors.backgroundLight,
          errorColor: LightColors.backgroundLight,
          infoColor: LightColors.backgroundLight,
          inputColor: LightColors.backgroundLight,
          successColor: LightColors.backgroundLight,
          warningColor: LightColors.backgroundLight,
          shadowColor: LightColors.backgroundLight,
          hintTextColor: LightColors.backgroundLight,
        ),
      ],
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: DarkColors.primaryDark)
          .copyWith(background: DarkColors.primaryDark),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: DarkColors.textColor,
          ),
          displayLarge: TextStyle(
            color: Colors.white,
          )),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: DarkColors.backgroundDark,
        iconTheme: IconThemeData(
          color: LightColors.white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.all(
              AppPadding.padding16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppRadius.radius24,
              ),
            ),
            side: BorderSide(
              width: 2.w,
              color: LightColors.white,
            ),
            textStyle: AppTextStyle.black_18BOLD),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightColors.white,
          padding: const EdgeInsets.all(
            AppPadding.padding16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppRadius.radius24,
            ),
          ),
          textStyle: const TextStyle(
            color: LightColors.black,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.radius24,
          ),
          borderSide: const BorderSide(
            color: LightColors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.radius24,
          ),
          borderSide: const BorderSide(
            color: LightColors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.radius24,
          ),
          borderSide: const BorderSide(
            color: LightColors.white,
          ),
        ),
      ),
      primaryColor: LightColors.primary,
      // primaryColorLight: LightColors.primaryLight,
      // primaryColorDark: LightColors.primaryDark,
      extensions: const <ThemeExtension<dynamic>>[
        ColorsStyles(
          backgroundColor: DarkColors.backgroundDark,
          textColor: DarkColors.backgroundDark,
          disableColor: DarkColors.backgroundDark,
          errorColor: DarkColors.backgroundDark,
          infoColor: DarkColors.backgroundDark,
          inputColor: DarkColors.backgroundDark,
          successColor: DarkColors.backgroundDark,
          warningColor: DarkColors.backgroundDark,
          shadowColor: DarkColors.backgroundDark,
          hintTextColor: DarkColors.backgroundDark,
        ),
      ],
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: DarkColors.primaryDark)
          .copyWith(background: DarkColors.primaryDark),
    );
  }
}
