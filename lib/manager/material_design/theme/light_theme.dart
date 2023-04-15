import 'package:flutter/material.dart';

import '../color_manager.dart';
import 'theme_manager.dart';

class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      useMaterial3: true,
      textTheme: getTextTheme(ColorManager.black),
      elevatedButtonTheme: getElevatedButtonTheme(),
      cardTheme: getCardTheme(ColorManager.white),
      appBarTheme: getAppBarTheme(ColorManager.lPrimary2),
      switchTheme: getSwitchTheme(Icons.light_mode_rounded, ColorManager.dPrimary),
      textButtonTheme: getTextButtonTheme(),
      
    );
  }
}
