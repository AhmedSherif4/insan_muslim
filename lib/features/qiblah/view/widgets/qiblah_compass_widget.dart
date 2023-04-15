import 'dart:math' show pi;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insan_muslim/common_widgets/loading_widget.dart';
import 'package:insan_muslim/manager/assets_manager.dart';
import 'package:insan_muslim/manager/localization/language_manager.dart';
import 'package:insan_muslim/manager/responsive_manager.dart';
import 'package:insan_muslim/manager/value_manager.dart';
import 'package:insan_muslim/utils/arabic_numbers.dart';

class QiblahCompassWidget extends StatelessWidget {
  final SvgPicture _compassImage = SvgPicture.asset(ImageAssets.compass);
  final SvgPicture _needleImage = SvgPicture.asset(
    ImageAssets.needle,
    fit: BoxFit.contain,
    height: ResponsiveManager.getVerticalSize(AppSize.s300),
    alignment: Alignment.center,
  );

  QiblahCompassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingWidget();
        }
        final QiblahDirection qiblahDirection = snapshot.data!;
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: (qiblahDirection.direction * (pi / 180) * -1),
              child: _compassImage,
            ),
            Transform.rotate(
              angle: (qiblahDirection.qiblah * (pi / 180) * -1),
              alignment: Alignment.center,
              child: _needleImage,
            ),
            Positioned(
              bottom: 8,
              child: Text(
                context.locale == englishLocale
                    ? "${qiblahDirection.offset.toStringAsFixed(3)}°"
                    : "${qiblahDirection.offset.toStringAsFixed(3)}°"
                        .toArabicNumbers,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          ],
        );
      },
    );
  }
}
