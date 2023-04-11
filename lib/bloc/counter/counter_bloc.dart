





import 'package:bloc/bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState > {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });
  
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });

  }
}
