part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();
}

final class ChangeTabCallEvent extends MainEvent {
  final MainTab tab;

  const ChangeTabCallEvent({
    required this.tab,
  });

  @override
  List<Object?> get props => [tab];
}
