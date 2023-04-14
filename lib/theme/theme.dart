import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
   
    useMaterial3: true,
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
   switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          // Set the color of the switch circle to green when the switch is turned on
          if (states.contains(MaterialState.selected)) {
            return Colors.green;
          }
          // Otherwise, use the default color
          return Colors.white;
        },
      ),
      trackColor: MaterialStateProperty.all<Color>(Colors.grey.shade400),
    ),
    useMaterial3: true,
  );
}