import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insan_muslim/features/prayer_time/view/widgets/text_input_formatter.dart';
import 'package:insan_muslim/manager/localization/language_manager.dart';
import 'package:insan_muslim/manager/responsive_manager.dart';
import 'package:insan_muslim/manager/value_manager.dart';
import 'package:insan_muslim/utils/arabic_numbers.dart';

import '../../../../manager/material_design/color_manager.dart';
import '../../cubit/prayer_time_cubit.dart';

class CustomPrayTimeWidget extends StatelessWidget {
  final String label;
  final String date;
  final void Function(String)? onSubmitted;
  CustomPrayTimeWidget(
      {super.key, required this.label, required this.date, this.onSubmitted});

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: ResponsiveManager.getVerticalSize(AppSize.s50),
          width: ResponsiveManager.getHorizontalSize(AppSize.s50),
          child: TextField(
            inputFormatters: [TimeTextInputFormatter()],
            cursorColor: ColorManager.lPrimary,
            controller: _textEditingController,
            onSubmitted: onSubmitted,
            enabled: BlocProvider.of<PrayerTimeCubit>(context).enabled,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.lPrimary),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.lPrimary),
              ),
              isDense: true,
              labelStyle: Theme.of(context).textTheme.titleMedium,
              hintStyle: Theme.of(context).textTheme.titleMedium,
              fillColor: ColorManager.lPrimary,
              focusColor: ColorManager.lPrimary,
              hoverColor: ColorManager.lPrimary,
              contentPadding: EdgeInsetsDirectional.all(
                  ResponsiveManager.getSize(AppPadding.p2)),
              labelText:
                  context.locale == englishLocale ? date : date.toArabicNumbers,
              hintText: '00:00',
            ),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
