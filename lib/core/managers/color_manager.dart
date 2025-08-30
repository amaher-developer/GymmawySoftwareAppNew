import 'package:flutter/material.dart';

class ColorManager {
  static Color? primaryColor(BuildContext context) =>
      Theme.of(context).primaryColor;
  static Color? activeBottomNavigationBarItemBackground(BuildContext context) =>
      Theme.of(context).primaryColor;

  static Color? greyOrangeColor(BuildContext context) =>
      Theme.of(context).focusColor;
  static Color? blackWhiteColor(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge!.color;
  static Color? darkWhiteColor(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge!.color;

  /// Dark colors
}

class LightColors {
  static const notificationColor = Color(0xFFFF7A7B);
  static const red = Color(0xFFFF3b30);
  static const green = Color(0xFF34c759);
  static const blue = Color(0xFF2196F3);
  static const grey = Color(0xFF9A9C9C);
  static const grey100 = Color(0xFFF5F5F5);
  static const grey300 = Color(0xFFe0e0e0);
  static const darkGrey = Color(0xFF757575);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const backgroundLight = Color(0xFFFFFFFF);
  static const primary = Color(0xFFC41A1B);
  static const transparent = Colors.transparent;
  static const primaryLight = Color(0xFFC41A1B);
  static const lightGreen = Color(0xFFA8EEEC);
  static const lightGreen2 = Color(0xFFC41A1B);
  static const secondary = Color(0xFFbce3F7);
  static const third = Color(0xff9a9c9c);
  static const secondaryLight = Color(0xFFeFFFFF);
  static const primaryText = Color(0xFF000000);
  static const secondaryText = Color(0xFF000000);
  static const priceColor = Color(0xFFBE303E);
  static const containerColor = Color(0xFF212121);
  static const dividerColor = Color.fromRGBO(249, 249, 249, 0.1);
  static const ratingColor = Color(0xFFEBD50D);
  static const orange = Color(0xFFFFAA29);

  static const aActiveBottomNavigationBarItemBackgroundLightColor =
      Color(0xFFFFFFFF);
  static const kPrimaryColor = Color(0xFFC41A1B);
  static const kSecondaryColor = Color(0xFFA38678);
  static const textColor = Colors.black;
  static const backgroundDark = Color(0xFF1E1E1E);
}

class DarkColors {
  static const textColor = Colors.white;
  static const backgroundDark = Color(0xFF1E1E1E);
  static const primaryDark = Color(0xFFF16768);
  static const secondaryDark = Color(0xFF8bb1c4);
  static const activeBottomNavigationBarItemBackgroundDarkColor =
      Color(0xFFE5BA46);
}

@immutable
class ColorsStyles extends ThemeExtension<ColorsStyles> {
  const ColorsStyles(
      {required this.backgroundColor,
      required this.disableColor,
      required this.textColor,
      required this.infoColor,
      required this.errorColor,
      required this.warningColor,
      required this.successColor,
      required this.shadowColor,
      required this.inputColor,
      required this.hintTextColor});

  final Color? backgroundColor;
  final Color? disableColor;
  final Color? textColor;
  final Color? infoColor;
  final Color? errorColor;
  final Color? warningColor;
  final Color? successColor;
  final Color? shadowColor;
  final Color? inputColor;
  final Color? hintTextColor;

  @override
  ColorsStyles copyWith({
    Color? backgroundColor,
    Color? disableColor,
    Color? textColor,
    Color? infoColor,
    Color? warningColor,
    Color? errorColor,
    Color? successColor,
    Color? shadowColor,
    Color? inputColor,
    Color? unSelectedColor,
    Color? cardColor,
    String? logo,
  }) {
    return ColorsStyles(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        disableColor: disableColor ?? this.disableColor,
        textColor: textColor ?? this.textColor,
        infoColor: infoColor ?? this.infoColor,
        warningColor: warningColor ?? this.warningColor,
        errorColor: errorColor ?? this.errorColor,
        successColor: successColor ?? this.successColor,
        inputColor: inputColor ?? this.inputColor,
        shadowColor: shadowColor ?? this.shadowColor,
        hintTextColor: hintTextColor);
  }

  @override
  ColorsStyles lerp(ThemeExtension<ColorsStyles>? other, double t) {
    if (other is! ColorsStyles) {
      return this;
    }
    return ColorsStyles(
        backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
        disableColor: Color.lerp(disableColor, other.disableColor, t),
        textColor: Color.lerp(textColor, other.textColor, t),
        infoColor: Color.lerp(infoColor, other.infoColor, t),
        warningColor: Color.lerp(warningColor, other.warningColor, t),
        errorColor: Color.lerp(errorColor, other.errorColor, t),
        successColor: Color.lerp(successColor, other.successColor, t),
        inputColor: Color.lerp(inputColor, other.inputColor, t),
        shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
        hintTextColor: Color.lerp(hintTextColor, other.hintTextColor, t));
  }
}
