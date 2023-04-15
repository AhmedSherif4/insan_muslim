// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/model/qurah_model.dart';
import '../../view_model/cubit/quran_cubit.dart';
import 'show_page.dart';
import 'slider_quran.dart';
import 'transition_pages.dart';

class QuranPage extends StatelessWidget {
  final List<AyahModel> pageOfQuranModel;

  const QuranPage({
    Key? key,
    required this.pageOfQuranModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int pageNumber = context.read<QuranCubit>().sliderNumberForPages;
    return SafeArea(
      child: Column(
        children: [
          ShowPage(pageOfQuranModel: pageOfQuranModel),
          TransitionPages(pageNumber: pageNumber),
          const SliderQuran()
        ],
      ),
    );
  }
}
