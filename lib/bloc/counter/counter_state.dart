




part of 'counter_bloc.dart';

 class CounterState {
  final int counter;

  CounterState({required this.counter});
  
}

class CounterInitial extends CounterState {
      CounterInitial() : super(counter: 0);
}
