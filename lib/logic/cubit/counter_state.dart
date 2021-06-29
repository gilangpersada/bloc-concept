part of 'counter_cubit.dart';

@immutable
class CounterState extends Equatable {
  final int counterValue;
  final bool wasIncremented;

  CounterState({
    @required this.counterValue,
    this.wasIncremented,
  });

  @override
  List<Object> get props => [
        this.counterValue,
        this.wasIncremented,
      ];
}
