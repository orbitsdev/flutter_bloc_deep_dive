



import 'package:bloc/bloc.dart';
import 'package:blockdeepdive/bloc/counter/counter_bloc.dart';
import 'package:blockdeepdive/bloc/namgechangger/name_changer_event.dart';
import 'package:blockdeepdive/bloc/namgechangger/name_changer_state.dart';


class NameChangerBloc extends Bloc<NameChangedEvent, NameChangerState > {
  NameChangerBloc() : super(NameChangerState()) {
    
    on<NameChangedEvent>((event, emit) {
      emit(NameChangerState(name: 'New Name When clicked now'));
    });
  
  }
}