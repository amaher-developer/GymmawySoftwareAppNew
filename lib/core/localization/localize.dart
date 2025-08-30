import 'package:flutter/cupertino.dart';
import 'package:flutter_translate/flutter_translate.dart';

export 'locale_keys/locale_keys.dart';

abstract class Localize {
  static String get(String key) {
    return translate(key);
  }

  static bool isEnglish({
    required BuildContext context,
  }) {
    return LocalizedApp.of(context).delegate.currentLocale.languageCode == 'en'
        ? true
        : false;
  }

  static Locale getLocale(BuildContext context) {
    return LocalizedApp.of(context).delegate.currentLocale;
  }

  static String getCurrentLanguageCode({
    required BuildContext context,
  }) {
    return LocalizedApp.of(context).delegate.currentLocale.languageCode;
  }

  static changeLanguage({
    required BuildContext context,
  }) {
    String? languageCode;
    String currentLanguageCode =
        LocalizedApp.of(context).delegate.currentLocale.languageCode;
    if (currentLanguageCode == 'en') languageCode = 'ar';
    if (currentLanguageCode == 'ar') languageCode = 'en';
    changeLocale(context, languageCode ?? '');
  }

  static changeLanguageTo({
    required BuildContext context,
    required String languageCode,
  }) {
    changeLocale(context, languageCode);
  }
}
