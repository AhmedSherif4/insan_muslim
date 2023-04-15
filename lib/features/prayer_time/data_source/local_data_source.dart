import 'package:shared_preferences/shared_preferences.dart';

const String preferenceKeyFajr = 'preferenceKeyFajr';
const String preferenceKeyDzuhr = 'preferenceKeyDzuhr';
const String preferenceKeyAsr = 'preferenceKeyAsr';
const String preferenceKeyMaghrib = 'preferenceKeyMaghrib';
const String preferenceKeyIsha = 'preferenceKeyIsha';

class PrayerTimeLocalDataSource {
  final SharedPreferences _sharedPreferences;

  PrayerTimeLocalDataSource(this._sharedPreferences);

  setFajrTime(String prayTime) {
    _sharedPreferences.setString(preferenceKeyFajr, prayTime);
  }

  String getFajrTime() {
    return _sharedPreferences.getString(preferenceKeyFajr) ?? '01:00';
  }

  setDzuhrTime(String prayTime) {
    _sharedPreferences.setString(preferenceKeyDzuhr, prayTime);
  }

  String getDzuhrTime() {
    return _sharedPreferences.getString(preferenceKeyDzuhr) ?? '02:00';
  }

  setAsrTime(String prayTime) {
    _sharedPreferences.setString(preferenceKeyAsr, prayTime);
  }

  String getAsrTime() {
    return _sharedPreferences.getString(preferenceKeyAsr) ?? '03:00';
  }

  setMaghribTime(String prayTime) {
    _sharedPreferences.setString(preferenceKeyMaghrib, prayTime);
  }

  String getMaghribTime() {
    return _sharedPreferences.getString(preferenceKeyMaghrib) ?? '04:00';
  }

  setIshaTime(String prayTime) {
    _sharedPreferences.setString(preferenceKeyIsha, prayTime);
  }

  String getIshaTime() {
    return _sharedPreferences.getString(preferenceKeyIsha) ?? '05:00';
  }

}
