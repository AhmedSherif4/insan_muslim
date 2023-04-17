import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:insan_muslim/features/prayer_time/data_source/local_data_source.dart';
import 'package:insan_muslim/features/quran/model/data_source/remote_data_source.dart';
import 'package:insan_muslim/features/quran/view_model/cubit/quran_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/home/controller/cubit/home_cubit.dart';
import '../features/prayer_time/cubit/prayer_time_cubit.dart';
import '../features/quran/view_model/repository/quran_repository.dart';
import '../manager/localization/localization_cubit/localization_cubit.dart';
import '../manager/material_design/theme/theme_cubit/theme_cubit.dart';
import 'app_preferences.dart';

final instanceGetIt = GetIt.instance;

Future<void> initAppModule() async {

  // shared Preferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  instanceGetIt
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // app Preferences instance
  instanceGetIt.registerLazySingleton<AppPreferences>(() => AppPreferences(
        instanceGetIt(),
      ));
  instanceGetIt.registerLazySingleton<PrayerTimeLocalDataSource>(
      () => PrayerTimeLocalDataSource(
            instanceGetIt(),
          ));

  // http
  Client client = Client();
  instanceGetIt.registerLazySingleton<Client>(() => client);


// repo of quran
  instanceGetIt.registerLazySingleton<QuranRemoteDataSource>(
      () => QuranRemoteDataSourceImpl(
            instanceGetIt(),
          ));
  instanceGetIt.registerLazySingleton<QuranBaseRepository>(
      () => QuranRepository(instanceGetIt()));

  // cubit
  instanceGetIt.registerFactory<ThemeCubit>(() => ThemeCubit(instanceGetIt()));
  instanceGetIt.registerFactory<LocalizationCubit>(
      () => LocalizationCubit(instanceGetIt()));
  instanceGetIt.registerFactory<HomeCubit>(() => HomeCubit());
  instanceGetIt
      .registerFactory<PrayerTimeCubit>(() => PrayerTimeCubit(instanceGetIt()));
  instanceGetIt.registerFactory<QuranCubit>(() => QuranCubit(instanceGetIt()));
}
