import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterState({required this.counterValue, required this.wasIncremented});

  // used to compare two CounterState objects by attribute then by object referance. Used in test.
  @override
  List<Object?> get props => [counterValue, wasIncremented];
}
