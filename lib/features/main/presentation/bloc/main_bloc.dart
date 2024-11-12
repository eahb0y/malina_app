import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/constants/constants.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<ChangeTabCallEvent>(_changeTab);
  }

  void _changeTab(ChangeTabCallEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(tab: event.tab));
  }
}
