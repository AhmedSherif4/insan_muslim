part of 'prayer_time_cubit.dart';

abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class PrayerTimeInitial extends PrayerTimeState {
  const PrayerTimeInitial();
  @override
  List<Object> get props => [];
}


class EnableEdit extends PrayerTimeState {
  const EnableEdit();
  @override
  List<Object> get props => [];
}

class GetEnabledChanged extends PrayerTimeState {
  const GetEnabledChanged();
  @override
  List<Object> get props => [];
}
