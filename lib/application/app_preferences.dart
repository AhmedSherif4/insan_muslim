import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../manager/localization/language_manager.dart';

const String preferenceKeyLanguage = 'preferenceKeyLanguage';
const String preferenceKeyDarkThemeModeOn = 'preferenceKeyDarkThemeModeOn';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // Locale settings
  Future<String> getAppLocale() async {
    String? appLocale = _sharedPreferences.getString(preferenceKeyLanguage);
    if (appLocale != null && appLocale.isNotEmpty) {
      return appLocale;
    } else {
      return LanguageType.arabic.getValue();
    }
  }

  Future<Locale> getLocale() async {
    if (await getAppLocale() == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  Future<void> changeLocale() async {
    if (await getAppLocale() == LanguageType.english.getValue()) {
      _sharedPreferences.setString(
          preferenceKeyLanguage, LanguageType.arabic.getValue());
    } else {
      _sharedPreferences.setString(
          preferenceKeyLanguage, LanguageType.english.getValue());
    }
  }

  // for theme mode
  setThemeMode(bool isDark) {
    _sharedPreferences.setBool(preferenceKeyDarkThemeModeOn, isDark);
  }

  bool themeModeIsDark() {
    return _sharedPreferences.getBool(preferenceKeyDarkThemeModeOn) ?? false;
  }
}
