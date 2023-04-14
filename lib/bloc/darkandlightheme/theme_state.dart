





import 'package:equatable/equatable.dart';

class ThemeState  extends Equatable {
  final bool isDark;
   
  const ThemeState({ this.isDark = false});

  @override
  List<Object?> get props => [isDark];
}