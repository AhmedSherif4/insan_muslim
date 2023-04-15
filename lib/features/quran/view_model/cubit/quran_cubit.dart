import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insan_muslim/application/handle_errors/failure.dart';
import 'package:insan_muslim/features/quran/view_model/repository/quran_repository.dart';

import '../../model/model/qurah_model.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final QuranBaseRepository _repository;
  QuranCubit(
    this._repository,
  ) : super(const QuranState());

  int sliderNumberForPages = 1;

  Future getQuran(int pageNumber) async {
    final Either<Failure, List<AyahModel>> result =
        await _repository.getQuran(pageNumber);
    sliderNumberForPages = pageNumber;
    result.fold(
      (failure) => emit(
        state.copyWith(
          requestStates: RequestStates.error,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          requestStates: RequestStates.loaded,
          pageOfQuranModel: data,
        ),
      ),
    );
  }

  double getFontSize = 20;

  setFontSize(double fontSize) {
    getFontSize = fontSize;
    emit(state.copyWith(
      requestStates: RequestStates.changeFontSize,
    ));
  }
}
