import 'package:bloc/bloc.dart';
import 'package:blockdeepdive/bloc/darkandlightheme/theme_event.dart';
import 'package:blockdeepdive/bloc/darkandlightheme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super( const ThemeState()) {
    
    on<SwithThemeEvent>(_onSwithTheme);
  }

  void _onSwithTheme(SwithThemeEvent event, Emitter<ThemeState> emit) {
     emit(ThemeState(isDark:event.isDark));
  }
}
