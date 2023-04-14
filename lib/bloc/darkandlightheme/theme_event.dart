


import 'package:equatable/equatable.dart';

class ThemeEvent  extends Equatable{
   const ThemeEvent();
   
     @override
    
     List<Object?> get props => [];
}


class SwithThemeEvent extends ThemeEvent{
 
  final bool isDark;
  const SwithThemeEvent({required this.isDark});
}