import 'package:bloc_test/bloc_test.dart';
import 'package:blocstudy/cubit/counter_cubit.dart';
import 'package:blocstudy/cubit/counter_state.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

// Run it by using the following commend
// flutter test
void main() {
  // group is like describe
  group("Countercubit", () {
    CounterCubit counterCubit = CounterCubit();

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test(
        "the initial state for the CounterCubit is CounterState(counterValue:0)",
        () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest(
      'the cubit should emit a CounterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () {
        return [CounterState(counterValue: 1, wasIncremented: true)];
      },
    );

    blocTest(
      'the cubit should emit a CounterState(counterValue:-1, wasIncremented:false) when cubit.decrement() function is called',
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: () {
        return [CounterState(counterValue: -1, wasIncremented: false)];
      },
    );
  });
}
