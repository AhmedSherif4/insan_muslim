
part of 'home_cubit.dart';

enum HomeTab {praterTime, qiblah}

class HomeState extends Equatable {
  final HomeTab tab;
  const HomeState({
    this.tab = HomeTab.praterTime,
  });

  @override
  List<Object> get props => [tab];
}

