part of 'main_bloc.dart';

class MainState extends Equatable {
  final MainTab tab;

  const MainState({
    this.tab = MainTab.home,
  });

  MainState copyWith({
    MainTab? tab,
  }) {
    return MainState(tab: tab ?? this.tab);
  }

  @override
  List<Object?> get props => [tab];
}
