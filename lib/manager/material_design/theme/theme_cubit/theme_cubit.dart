import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/app_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final AppPreferences _appPreferences;

  ThemeCubit(this._appPreferences) : super(const ThemeInitial());

  isDark(bool value) {
    _appPreferences.setThemeMode(value);
    emit(const SetTheme());
  }

  bool getThemeMode() {
    emit(const GetTheme());
    return _appPreferences.themeModeIsDark();
  }
}
