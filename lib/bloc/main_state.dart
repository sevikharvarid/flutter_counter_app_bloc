import 'package:equatable/equatable.dart';

class MainState extends Equatable {
  int? value;

  MainState({
    this.value,
  });
  @override
  List<Object?> get props => [value];
}
