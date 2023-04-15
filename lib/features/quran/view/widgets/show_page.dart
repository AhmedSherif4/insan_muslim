import 'package:flutter/material.dart';
import 'package:insan_muslim/utils/arabic_numbers.dart';

import '../../../../manager/responsive_manager.dart';
import '../../../../manager/value_manager.dart';
import '../../model/model/qurah_model.dart';

class ShowPage extends StatelessWidget {
  const ShowPage({
    super.key,
    required this.pageOfQuranModel,
  });

  final List<AyahModel> pageOfQuranModel;

  String getFullPage(BuildContext context) {
    String fullPage = '';

    for (var i = 0; i < pageOfQuranModel.length; i++) {
      if (pageOfQuranModel[i].numberInSurah == 1) {
        fullPage +=
            '\n' ' \uFD3F' '${pageOfQuranModel[i].surah.name}' '\uFD3E ' '\n';
      }
      fullPage += '${pageOfQuranModel[i].text}'
          ' \uFD3F'
          '${pageOfQuranModel[i].numberInSurah.toArabicNumbers}'
          '\uFD3E ';
    }
    return fullPage;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveManager.getHorizontalSize(AppPadding.p16),
          vertical: ResponsiveManager.getVerticalSize(AppPadding.p16),
        ),
        child: Center(
          child: SingleChildScrollView(
              child: Text(
            getFullPage(context),
            style: Theme.of(context).textTheme.displayLarge!.copyWith(),
            textAlign: TextAlign.justify,
            textDirection: TextDirection.rtl,
          )),
        ),
      ),
    );
  }
}
