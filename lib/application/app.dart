import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';

import '../features/home/controller/cubit/home_cubit.dart';
import '../features/prayer_time/cubit/prayer_time_cubit.dart';
import '../features/quran/view_model/cubit/quran_cubit.dart';
import '../manager/localization/localization_cubit/localization_cubit.dart';
import '../manager/material_design/theme/theme_cubit/theme_cubit.dart';
import '../manager/material_design/theme/theme_manager.dart';
import '../manager/route_manager.dart';
import 'app_preferences.dart';
import 'dependency_injection.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = instanceGetIt<AppPreferences>();
  @override
  void didChangeDependencies() {
    _appPreferences.getLocale().then((locale) => context.setLocale(locale));
    _appPreferences
        .getAppLocale()
        .then((locale) => HijriCalendar.setLocal(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => instanceGetIt<ThemeCubit>()),
        BlocProvider(create: (_) => instanceGetIt<LocalizationCubit>()),
        BlocProvider(create: (_) => instanceGetIt<HomeCubit>()),
        BlocProvider(create: (_) => instanceGetIt<PrayerTimeCubit>()),
        BlocProvider(create: (_) => instanceGetIt<QuranCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.homeRoute,
            theme: ThemeManager.appThemeData[AppTheme.light],
            darkTheme: ThemeManager.appThemeData[AppTheme.dark],
            themeMode: context.read<ThemeCubit>().getThemeMode()
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}
