import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insan_muslim/manager/responsive_manager.dart';
import 'package:insan_muslim/manager/value_manager.dart';

import '../../../../manager/string_manager.dart';
import '../../cubit/prayer_time_cubit.dart';
import 'custom_prayer_time_widget.dart';

class PrayersWidget extends StatelessWidget {
  const PrayersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: ResponsiveManager.getSize(AppSize.s10),
        alignment: WrapAlignment.center,
        children: [
          CustomPrayTimeWidget(
            label: AppStrings.fajr,
            date: context.read<PrayerTimeCubit>().getFajrTime(),
            onSubmitted: (prayTime) {
              context.read<PrayerTimeCubit>().setFajrTime(prayTime);
            },
          ),
          CustomPrayTimeWidget(
            label: AppStrings.dzuhr,
            date: context.read<PrayerTimeCubit>().getDzuhrTime(),
            onSubmitted: (prayTime) {
              context.read<PrayerTimeCubit>().setDzuhrTime(prayTime);
            },
          ),
          CustomPrayTimeWidget(
            label: AppStrings.asr,
            date: context.read<PrayerTimeCubit>().getAsrTime(),
            onSubmitted: (prayTime) {
              context.read<PrayerTimeCubit>().setAsrTime(prayTime);
            },
          ),
          CustomPrayTimeWidget(
            label: AppStrings.maghrib,
            date: context.read<PrayerTimeCubit>().getMaghribTime(),
            onSubmitted: (prayTime) {
              context.read<PrayerTimeCubit>().setMaghribTime(prayTime);
            },
          ),
          CustomPrayTimeWidget(
            label: AppStrings.isha,
            date: context.read<PrayerTimeCubit>().getIshaTime(),
            onSubmitted: (prayTime) {
              context.read<PrayerTimeCubit>().setIshaTime(prayTime);
            },
          ),
        ],
      ),
    );
  }
}
