import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../responsive_manager.dart';
import '../../value_manager.dart';
import '../color_manager.dart';
import '../font_manager.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

enum AppTheme { light, dark }

class ThemeManager {
  static final Map<AppTheme, ThemeData> appThemeData = {
    AppTheme.light: LightTheme().buildLightTheme(),
    AppTheme.dark: DarkTheme().buildDarkTheme(),
  };
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

// class for sharing themes that duplicate with light and dark mode.
mixin SubThemeData {
  TextButtonThemeData getTextButtonTheme() => TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(ResponsiveManager.getSize(AppSize.s22))),
          )),
          backgroundColor: MaterialStatePropertyAll(ColorManager.lPrimary),
        ),
      );

  SwitchThemeData getSwitchTheme(IconData icon, Color color) => SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(ColorManager.dPurple),
        thumbIcon: MaterialStatePropertyAll(Icon(icon)),
        trackColor: MaterialStatePropertyAll(color),
        overlayColor: MaterialStatePropertyAll(ColorManager.dPurple2),
      );
  AppBarTheme getAppBarTheme(Color? colorDependOnTheme) =>
      AppBarTheme(backgroundColor: colorDependOnTheme);
  CardTheme getCardTheme(Color? colorDependOnTheme) => CardTheme(
        color: colorDependOnTheme,
        margin: EdgeInsets.all(ResponsiveManager.getSize(AppSize.s10)),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(ResponsiveManager.getSize(AppSize.s10))),
        ),
      );
  ElevatedButtonThemeData getElevatedButtonTheme() => ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorManager.white),
          fixedSize: MaterialStatePropertyAll(Size(
              ResponsiveManager.getHorizontalSize(AppSize.s190),
              ResponsiveManager.getVerticalSize(AppSize.s55))),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(ResponsiveManager.getSize(AppSize.s10))),
            ),
          ),
        ),
      );

  TextTheme getTextTheme(Color? colorDependOnTheme) =>
      GoogleFonts.quicksandTextTheme(TextTheme(
        bodyMedium: TextStyle(
          fontSize: ResponsiveManager.getFontSize(FontSize.s14),
          fontWeight: FontWeightManager.regular,
          fontStyle: FontStyle.normal,
          color: colorDependOnTheme,
        ),
        bodyLarge: TextStyle(
          fontSize: ResponsiveManager.getFontSize(FontSize.s40),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: ColorManager.white,
        ),
        titleSmall: TextStyle(
          fontSize: ResponsiveManager.getFontSize(FontSize.s14),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: ColorManager.lPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: ResponsiveManager.getFontSize(FontSize.s14),
          fontWeight: FontWeightManager.bold,
          fontStyle: FontStyle.normal,
          color: ColorManager.white,
        ),
        titleLarge: TextStyle(
          fontSize: ResponsiveManager.getFontSize(FontSize.s20),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: ColorManager.white,
        ),
        displaySmall: TextStyle(
          fontSize: ResponsiveManager.getFontSize(FontSize.s40),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: ColorManager.white,
        ),
        displayLarge: TextStyle(
          fontSize: ResponsiveManager.getFontSize(FontSize.s20),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          color: colorDependOnTheme,
        ),
      ));
}

extension AppThemeX on AppTheme {
  bool get isLight => this == AppTheme.light;
  bool get isDark => this == AppTheme.dark;
}

