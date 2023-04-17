
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/material_design/theme/theme_cubit/theme_cubit.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      final ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context);
      return Switch.adaptive(
        value: themeCubit.getThemeMode(),
        onChanged: (isDark) {
          themeCubit.isDark(isDark);
        },
      );
    });
  }
}
