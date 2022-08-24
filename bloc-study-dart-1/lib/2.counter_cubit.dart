import 'dart:async';

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  // we are initializing the initial state to zero
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}

void main(List<String> args) {
  final cubit = CounterCubit();
  cubit.stream.listen((event) => print(event));

  print(cubit.state); // Should print 0 = the default state
  cubit.increment();
  print(cubit.state); // Should print 1
  cubit.increment();
  print(cubit.state); // should print 2
  cubit.decrement();
  print(cubit.state); // should print 1
  cubit.decrement();
  print(cubit.state); // should print 0
  cubit.close();
}
