import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../manager/material_design/color_manager.dart';
import '../../../../manager/string_manager.dart';
import '../../cubit/prayer_time_cubit.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
        builder: (context, state) => TextButton.icon(
            onPressed: () {
              bool enabled =
                  BlocProvider.of<PrayerTimeCubit>(context).getEnabled();
              if (enabled == true) {
                BlocProvider.of<PrayerTimeCubit>(context).enabledEdit(false);
              } else if (enabled == false) {
                BlocProvider.of<PrayerTimeCubit>(context).enabledEdit(true);
              }
            },
            icon: Icon(
              BlocProvider.of<PrayerTimeCubit>(context).enabled == true
                  ? Icons.done_outline_rounded
                  : Icons.edit,
              color: ColorManager.white,
            ),
            label: Text(
              BlocProvider.of<PrayerTimeCubit>(context).enabled == true
                  ? AppStrings.done.tr()
                  : AppStrings.editPrayersTime.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            )),
      ),
    );
  }
}
