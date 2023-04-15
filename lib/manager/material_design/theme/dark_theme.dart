import 'package:flutter/material.dart';

import '../color_manager.dart';
import 'theme_manager.dart';

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      useMaterial3: true,
      textTheme: getTextTheme(ColorManager.white),
      elevatedButtonTheme: getElevatedButtonTheme(),
      cardTheme: getCardTheme(ColorManager.dPurple),
      appBarTheme: getAppBarTheme(ColorManager.dPrimary),
      switchTheme:
          getSwitchTheme(Icons.dark_mode_rounded, ColorManager.lPrimary2),
      textButtonTheme: getTextButtonTheme(),
    );
  }
}
