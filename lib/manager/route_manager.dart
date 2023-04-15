import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:insan_muslim/features/prayer_time/view/screens/prayer_time_view.dart';
import 'package:insan_muslim/features/qiblah/view/screens/qiblah_view.dart';
import 'package:insan_muslim/features/quran/view/screens/quran_view.dart';

import '../features/home/home_view.dart';
import 'string_manager.dart';

class Routes {
  static const String homeRoute = 'homeRoute';
  static const String prayerTimeRoute = 'prayerTimeRoute';
  static const String qiblahRoute = 'qiblahRoute';
  static const String quranRoute = 'quranRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.prayerTimeRoute:
        return MaterialPageRoute(builder: (_) =>  PrayerTimeView());
      case Routes.qiblahRoute:
        return MaterialPageRoute(builder: (_) =>  QiblahView());
      case Routes.quranRoute:
        return MaterialPageRoute(builder: (_) => const QuranView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const UnDefinedView(),
    );
  }
}

class UnDefinedView extends StatelessWidget {
  const UnDefinedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRouteFound).tr(),
      ),
      body: Center(
        child: const Text(AppStrings.noRouteFound).tr(),
      ),
    );
  }
}
