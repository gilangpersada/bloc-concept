import 'package:bloc_concept/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Cubit', () {
    CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });
    test(
        'the initial state for the Counter Cubit is Counter State(counterValue:0)',
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
      'the cubit should emit a CounterState(counterValue:-1, wasIncremented:false) when cubit.decrement() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: [CounterState(counterValue: -1, wasIncremented: false)],
    );
    blocTest(
      'the cubit should emit a CounterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: [CounterState(counterValue: 1, wasIncremented: true)],
    );
  });
}
