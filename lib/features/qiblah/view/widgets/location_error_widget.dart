import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:insan_muslim/manager/material_design/color_manager.dart';
import 'package:insan_muslim/manager/responsive_manager.dart';
import 'package:insan_muslim/manager/value_manager.dart';

import '../../../../manager/string_manager.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.location_off,
            size: ResponsiveManager.getSize(AppSize.s160),
            color: ColorManager.error,
          ),
          SizedBox(height: ResponsiveManager.getVerticalSize(AppSize.s32)),
          Text(
            error!,
            style: TextStyle(
                color: ColorManager.error, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: ResponsiveManager.getVerticalSize(AppSize.s32)),
          ElevatedButton(
            child: Text(AppStrings.retry.tr()),
            onPressed: () {
              if (callback != null) callback!();
            },
          )
        ],
      ),
    );
  }
}
