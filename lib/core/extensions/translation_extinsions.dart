import 'package:flutter_translate/flutter_translate.dart';

extension TranslationProcess on String {
  String get translated {
    String translatedText = translate(this);
    return translatedText;
  }
}
