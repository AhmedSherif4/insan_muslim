import 'dart:ui';

enum LanguageType{
  english, arabic,
}
const String arabic = 'ar';
const String english = 'en';

// path the file for languages
const String assetPathLocalization = 'assets/translations';

const Locale arabicLocale = Locale('ar', 'SA');
const Locale englishLocale = Locale('en', 'US');

extension LanguageTypeExtension on LanguageType{
  String getValue(){
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}