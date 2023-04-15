import 'package:flutter/material.dart';

import '../manager/material_design/color_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ColorManager.lPrimary2,
        backgroundColor: ColorManager.lPrimary,
      ),
    );
  }
}
