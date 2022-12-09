import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainStarted extends MainEvent {
  @override
  List<Object?> get props => [];
}

class Increament extends MainEvent {
  @override
  List<Object?> get props => [];
}

class Decreament extends MainEvent {
  @override
  List<Object?> get props => [];
}
