import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insan_muslim/manager/responsive_manager.dart';
import 'package:insan_muslim/manager/value_manager.dart';
import 'package:insan_muslim/utils/arabic_numbers.dart';

import '../../../../manager/material_design/color_manager.dart';
import '../../view_model/cubit/quran_cubit.dart';

class TransitionPages extends StatelessWidget {
   TransitionPages({
    super.key,
    required this.pageNumber,
  });

  final int pageNumber;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
              onPressed: pageNumber == 1
                  ? null
                  : () => context.read<QuranCubit>().getQuran(pageNumber - 1),
              icon: const Icon(Icons.arrow_back_rounded)),
        ),
        SizedBox(
          width: ResponsiveManager.getHorizontalSize(AppSize.s32),
          child: TextField(
            controller: _textEditingController,
            cursorColor: ColorManager.lPrimary,
            onSubmitted: (value) {
              int numberNewPage = int.parse(value);
              numberNewPage = numberNewPage > 604
                  ? 604
                  : numberNewPage < 1
                      ? 1
                      : numberNewPage;
              context.read<QuranCubit>().getQuran(numberNewPage);
              _textEditingController.clear();
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.lPrimary),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.lPrimary),
              ),
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: ColorManager.lPrimary,
              focusColor: ColorManager.lPrimary,
              hoverColor: ColorManager.lPrimary,
              contentPadding: EdgeInsetsDirectional.all(
                  ResponsiveManager.getSize(AppPadding.p2)),
              labelText: pageNumber.toArabicNumbers,
              hintText: '000',
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: IconButton(
              onPressed: pageNumber == 604
                  ? null
                  : () => context.read<QuranCubit>().getQuran(pageNumber + 1),
              icon: const Icon(Icons.arrow_forward_rounded)),
        )
      ],
    );
  }
}
