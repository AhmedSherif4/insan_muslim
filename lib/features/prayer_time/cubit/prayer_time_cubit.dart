import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data_source/local_data_source.dart';


part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  final PrayerTimeLocalDataSource _dataSource;
  PrayerTimeCubit(this._dataSource) : super(const PrayerTimeInitial());

  bool enabled = false;

  enabledEdit(bool enable) {
    enabled = enable;
    emit(const EnableEdit());
  }

  bool getEnabled() {
    emit(const GetEnabledChanged());
    return enabled;
  }

  setFajrTime(String prayTime) {
    _dataSource.setFajrTime(prayTime);
  }

  String getFajrTime() => _dataSource.getFajrTime();

  setDzuhrTime(String prayTime) {
    _dataSource.setDzuhrTime(prayTime);
  }

  String getDzuhrTime() => _dataSource.getDzuhrTime();

  setAsrTime(String prayTime) {
    _dataSource.setAsrTime(prayTime);
  }

  String getAsrTime() => _dataSource.getAsrTime();

  setMaghribTime(String prayTime) {
    _dataSource.setMaghribTime(prayTime);
  }

  String getMaghribTime() => _dataSource.getMaghribTime();

  setIshaTime(String prayTime) {
    _dataSource.setIshaTime(prayTime);
  }

  String getIshaTime() => _dataSource.getIshaTime();
}
