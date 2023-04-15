import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../manager/material_design/color_manager.dart';
import '../../view_model/cubit/quran_cubit.dart';

class SliderQuran extends StatelessWidget {
  const SliderQuran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<QuranCubit, QuranState>(
          builder: (context, state) {
            return Slider.adaptive(
              value: context.read<QuranCubit>().sliderNumberForPages.toDouble(),
              onChanged: (value) {
                context.read<QuranCubit>().getQuran(value.toInt());
              },
              min: 1,
              max: 604,
              thumbColor: ColorManager.lPrimary2,
            );
          },
        ),
        /* BlocBuilder<QuranCubit, QuranState>(
          builder: (context, state) {
            return Slider.adaptive(
              value: context.read<QuranCubit>().getFontSize.toDouble(),
              onChanged: (value) {
                context.read<QuranCubit>().setFontSize(value);
              },
              min: 20,
              max: 40,
              thumbColor: ColorManager.lPrimary2,
            );
          },
        ), */
      ],
    );
  }
}
