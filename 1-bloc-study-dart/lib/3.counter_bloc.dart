import 'dart:async';

import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  // we are initializing the initial state to zero
  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}

void main(List<String> args) {
  final bloc = CounterBloc();

  bloc.stream.listen((event) => print(event));

  bloc.add(Increment());
  bloc.add(Increment());
  bloc.add(Decrement());
  bloc.add(Decrement());

  bloc.close();
}
