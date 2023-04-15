import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insan_muslim/features/quran/view_model/cubit/quran_cubit.dart';

import '../../manager/assets_manager.dart';
import '../../manager/material_design/color_manager.dart';
import '../../manager/responsive_manager.dart';
import '../../manager/route_manager.dart';
import '../../manager/value_manager.dart';
import '../prayer_time/view/screens/prayer_time_view.dart';
import '../qiblah/view/screens/qiblah_view.dart';
import 'controller/cubit/home_cubit.dart';
import 'widgets/locale_switch.dart';
import 'widgets/tab_button.dart';
import 'widgets/theme_switch.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeTab selectedTab =
        context.select((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      appBar: AppBar(
        actions: const [
          ThemeSwitchWidget(),
          LocaleSwitchWidget(),
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveManager.getHorizontalSize(AppPadding.p14),
          vertical: ResponsiveManager.getVerticalSize(AppPadding.p14),
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.background), fit: BoxFit.fill),
        ),
        child: IndexedStack(
          index: selectedTab.index,
          children: [PrayerTimeView(), QiblahView()],
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.white,
        elevation: 10,
        shape: const CircleBorder(),
        onPressed: () async {
          await context.read<QuranCubit>().getQuran(1);
          if (context.mounted) {
            Navigator.pushNamed(context, Routes.quranRoute);
          }
        },
        child: Icon(
          Icons.menu_book_rounded,
          color: ColorManager.lPrimary2,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.praterTime,
              icon: const Icon(Icons.list_rounded),
            ),
            HomeTabButton(
              groupValue: selectedTab,
              value: HomeTab.qiblah,
              icon: const Icon(Icons.show_chart_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
