import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../../../../common_widgets/error_widget.dart';
import '../../../../common_widgets/loading_widget.dart';
import '../../../../manager/string_manager.dart';
import '../widgets/qiblah_compass.dart';

class QiblahView extends StatelessWidget {
  const QiblahView({super.key});

  Future<bool> _deviceSupport() async {
    bool? deviceSupport = await FlutterQiblah.androidDeviceSensorSupport();

    return deviceSupport ?? false;
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Center(
        child: Text(AppStrings.yourDeviceIsNotSupported.tr()),
      );
    } else {
      return FutureBuilder(
        future: _deviceSupport(),
        builder: (_, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          }
          if (snapshot.hasError) {
            return errorMessageSnackBar(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return const QiblahCompass();
          } else {
            return Center(
              child: Text(AppStrings.yourDeviceIsNotSupported.tr()),
            );
          }
        },
      );
    }
  }
}
