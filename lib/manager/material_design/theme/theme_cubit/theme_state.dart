part of 'theme_cubit.dart';

@immutable
abstract class ThemeState extends Equatable {
  const ThemeState();
  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial();
}

class SetTheme extends ThemeState {
  const SetTheme();
}

class GetTheme extends ThemeState {
  const GetTheme();
}