import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'application/app.dart';
import 'application/dependency_injection.dart';
import 'utils/counter_observer.dart';
import 'manager/localization/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await initAppModule();

  Bloc.observer = CounterObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocale, englishLocale],
      path: assetPathLocalization,
      child: Phoenix(
        child: MyApp(),
      ),
    ),
  );
}
