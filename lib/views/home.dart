import 'package:blockdeepdive/bloc/counter/counter_bloc.dart';
import 'package:blockdeepdive/bloc/namgechangger/name_changer_bloc.dart';
import 'package:blockdeepdive/bloc/namgechangger/name_changer_event.dart';
import 'package:blockdeepdive/bloc/namgechangger/name_changer_state.dart';
import 'package:blockdeepdive/widgets/v_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static const String screen_name = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOCK DEEP DIVE'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const VSpace(20),
          BlocBuilder<NameChangerBloc, NameChangerState>(
            builder: (context, state) {
              return Text('Name Value ${state.name}');
            },
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(state.counter.toString());
            },
          ),
          const VSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () =>  context.read<CounterBloc>().add(CounterDecrementEvent()),
                  icon: const Icon(Icons.remove)),
              IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
                  icon: const Icon(Icons.add)),
            ],
          ),
           IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => context.read<NameChangerBloc>().add(NameChangedEvent()),
                  icon: const Text('Chnage Name'),),
        ],
      ),
    );
  }
}
