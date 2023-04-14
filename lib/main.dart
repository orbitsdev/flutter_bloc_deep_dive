import 'package:blockdeepdive/bloc/counter/counter_bloc.dart';
import 'package:blockdeepdive/bloc/darkandlightheme/theme_bloc.dart';
import 'package:blockdeepdive/bloc/darkandlightheme/theme_state.dart';
import 'package:blockdeepdive/bloc/namgechangger/name_changer_bloc.dart';
import 'package:blockdeepdive/bloc/task/task_block.dart';
import 'package:blockdeepdive/models/task.dart';
import 'package:blockdeepdive/theme/theme.dart';
import 'package:blockdeepdive/views/home.dart';
import 'package:blockdeepdive/scroll/test.dart';
import 'package:blockdeepdive/views/login_screen.dart';
import 'package:blockdeepdive/views/recycle_bin_screen.dart';
import 'package:blockdeepdive/views/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlockDeepDive());
}

class BlockDeepDive extends StatefulWidget {
  const BlockDeepDive({Key? key}) : super(key: key);

  @override
  _BlockDeepDiveState createState() => _BlockDeepDiveState();
}

class _BlockDeepDiveState extends State<BlockDeepDive> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (_) => CounterBloc(),
        ),
        BlocProvider<NameChangerBloc>(
          create: (_) => NameChangerBloc(),
        ),
        BlocProvider<TaskBloc>(
          create: (_) => TaskBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme:state.isDark == true ? AppTheme.darkTheme : AppTheme.lightTheme,
              routes: {
                Home.screen_name: (_) => Home(),
                LoginScreen.screen_name: (_) => LoginScreen(),
                TaskScreen.screen_name: (_) => TaskScreen(),
                Test.screen_name: (_) => Test(),
                RecycleBinScreen.screen_name: (_) => RecycleBinScreen(),
              },
              home: LoginScreen());
        },
      ),
    );
  }
}
