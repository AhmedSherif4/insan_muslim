import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insan_muslim/manager/value_manager.dart';

import '../../../manager/material_design/color_manager.dart';
import '../controller/cubit/home_cubit.dart';


class HomeTabButton extends StatelessWidget {
  const HomeTabButton({super.key, 
    required this.groupValue,
    required this.value,
    required this.icon,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      iconSize: AppSize.s32,
      color:
          groupValue != value ? null : ColorManager.lPrimary2,
      icon: icon,
    );
  }
}
