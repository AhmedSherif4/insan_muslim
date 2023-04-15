import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insan_muslim/common_widgets/loading_widget.dart';
import 'package:insan_muslim/features/quran/view_model/cubit/quran_cubit.dart';
import 'package:insan_muslim/manager/responsive_manager.dart';
import 'package:insan_muslim/manager/value_manager.dart';

import '../../../../common_widgets/error_widget.dart';
import '../widgets/quran_widget.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<QuranCubit, QuranState>(
        listener: (context, state) {
          if (state.requestStates == RequestStates.error) {
            errorMessageSnackBar(state.errorMessage);
          }
        },
        builder: (context, state) {
          switch (state.requestStates) {
            case RequestStates.error:
              return SizedBox(
                height: ResponsiveManager.getVerticalSize(AppSize.s300),
                child: Center(
                  child: Text(state.errorMessage),
                ),
              );
            case RequestStates.loading:
              return const LoadingWidget();
            case RequestStates.loaded:
            case RequestStates.changeFontSize:
              return QuranPage(
                pageOfQuranModel: state.pageOfQuranModel,
              );
            
          }
        },
      ),
    );
  }
}
