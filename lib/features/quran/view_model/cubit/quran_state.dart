part of 'quran_cubit.dart';

enum RequestStates { loading, loaded, error }

class QuranState extends Equatable {
  final RequestStates requestStates;
  final String errorMessage;
  final List<AyahModel> pageOfQuranModel;
  const QuranState({
    this.requestStates = RequestStates.loading,
    this.errorMessage = '',
    this.pageOfQuranModel = const [],
  });

  @override
  List<Object?> get props => [requestStates, errorMessage, pageOfQuranModel];

  QuranState copyWith({
    RequestStates? requestStates,
    String? errorMessage,
    List<AyahModel>? pageOfQuranModel,
  }) {
    return QuranState(
      requestStates: requestStates ?? this.requestStates,
      errorMessage: errorMessage ?? this.errorMessage,
      pageOfQuranModel: pageOfQuranModel ?? this.pageOfQuranModel,
    );
  }
}
