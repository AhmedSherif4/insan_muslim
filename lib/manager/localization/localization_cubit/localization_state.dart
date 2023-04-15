part of 'localization_cubit.dart';

@immutable
abstract class LocalizationState extends Equatable {
  const LocalizationState();
  @override
  List<Object> get props => [];
}

class LocalizationInitial extends LocalizationState {
  const LocalizationInitial();
}

class ChangeLocale extends LocalizationState {
  const ChangeLocale();
}
