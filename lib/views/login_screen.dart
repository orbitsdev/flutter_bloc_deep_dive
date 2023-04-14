import 'package:blockdeepdive/bloc/darkandlightheme/theme_bloc.dart';
import 'package:blockdeepdive/bloc/darkandlightheme/theme_event.dart';
import 'package:blockdeepdive/bloc/darkandlightheme/theme_state.dart';
import 'package:blockdeepdive/widgets/drawer_widget.dart';
import 'package:blockdeepdive/widgets/h_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String screen_name = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool _isDark = false;

  void _switchTheme(bool value) {
    setState(() {
      _isDark = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
          
            return Drawer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('App '),
                    Text('${state.isDark}'),
                    Switch(
                        value: state.isDark, onChanged: (value){
                        
                         context.read<ThemeBloc>().add(SwithThemeEvent(isDark: value));
                        })
                  ],
                ),
              ),
            );
          },
        ),
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailcontroller,
                ),
                const HSpace(10),
                TextFormField(
                  controller: _passwordcontroller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
