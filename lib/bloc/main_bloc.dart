import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:untitled/bloc/main_event.dart';
import 'package:untitled/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState(value: 0)) {
    on<Increament>(_addValue);
    on<Decreament>(_substractValue);
  }

  FutureOr<void> _addValue(Increament event, dynamic emit) =>
      emit(MainState(value: state.value! + 1));
  FutureOr<void> _substractValue(Decreament event, dynamic emit) {
    if (state.value! > 0) {
      emit(MainState(value: state.value! - 1));
    }
  }
}
