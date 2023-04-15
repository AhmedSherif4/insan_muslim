
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../manager/localization/localization_cubit/localization_cubit.dart';

class LocaleSwitchWidget extends StatelessWidget {
  const LocaleSwitchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
      final LocalizationCubit localCubit =
          BlocProvider.of<LocalizationCubit>(context);
      return IconButton(
          onPressed: () {
            localCubit.changeLocaleEvent();
            Phoenix.rebirth(context);
          },
          icon: const Icon(Icons.translate_rounded));
    });
  }
}
