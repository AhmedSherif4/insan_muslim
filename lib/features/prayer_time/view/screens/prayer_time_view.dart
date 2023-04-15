import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:insan_muslim/manager/localization/language_manager.dart';
import 'package:insan_muslim/manager/responsive_manager.dart';
import 'package:insan_muslim/manager/value_manager.dart';
import 'package:insan_muslim/utils/arabic_numbers.dart';

import '../widgets/edit_button.dart';
import '../widgets/prayers.dart';

class PrayerTimeView extends StatelessWidget {
  PrayerTimeView({super.key});

  final HijriCalendar hijriDate = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale == englishLocale;
    return ListView(
      children: [
        Text(
          isEnglish
              ? hijriDate.toFormat('MMMM d, yyyy')
              : hijriDate.toFormat('MMMM d, yyyy').toArabicNumbers,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: ResponsiveManager.getVerticalSize(AppSize.s50),
        ),
        Center(
          child: Text(
            isEnglish
                ? DateFormat('hh:mm a').format(DateTime.now())
                : DateFormat('hh:mm a')
                    .format(DateTime.now())
                    .toArabicNumbers
                    .toArabicATime,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        SizedBox(
          height: ResponsiveManager.getVerticalSize(AppSize.s50),
        ),
        const EditButton(),
        const PrayersWidget(),
      ],
    );
  }
}
