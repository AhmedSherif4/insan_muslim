import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:insan_muslim/common_widgets/loading_widget.dart';
import 'package:insan_muslim/features/qiblah/view_model/view_model_qiblah.dart';
import 'package:insan_muslim/manager/responsive_manager.dart';
import 'package:insan_muslim/manager/value_manager.dart';

import '../../../../manager/string_manager.dart';
import 'location_error_widget.dart';
import 'qiblah_compass_widget.dart';

class QiblahCompass extends StatefulWidget {
  const QiblahCompass({super.key});

  @override
  State<QiblahCompass> createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final ViewModelQiblah _viewModelQiblah = ViewModelQiblah();

  @override
  void initState() {
    _viewModelQiblah.checkLocationStatus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModelQiblah.locationStreamController.close();
    FlutterQiblah().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(ResponsiveManager.getSize(AppPadding.p8)),
      child: StreamBuilder(
        stream: _viewModelQiblah.streamCompass,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          }
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();
              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: AppStrings.locationServicePermissionDenied.tr(),
                  callback: _viewModelQiblah.checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: AppStrings.locationServiceDeniedForever.tr(),
                  callback: _viewModelQiblah.checkLocationStatus,
                );
              default:
                return Container();
            }
          } else {
            return LocationErrorWidget(
              error: AppStrings.pleaseEnableLocationService.tr(),
              callback: _viewModelQiblah.checkLocationStatus,
            );
          }
        },
      ),
    );
  }
}
