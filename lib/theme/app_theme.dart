import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(backgroundColor: Color(0xff121212), elevation: 2),
    scaffoldBackgroundColor: Color(0xff171717),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffffffff),
        foregroundColor: Color(0xff121212),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.black),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.grey.shade300; // Thumb color when ON
        }
        return Colors.white; // Thumb color when OFF
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.green; // Track color when ON
        }
        return Colors.black; // Track color when OFF
      }),
    ),
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(backgroundColor: Color(0xffeeeeee), elevation: 2),
    scaffoldBackgroundColor: Color(0xffffffff),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff121212),
        foregroundColor: Color(0xffffffff),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.grey.shade300; // Thumb color when ON
        }
        return Colors.black; // Thumb color when OFF
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.green; // Track color when ON
        }
        return Colors.white; // Track color when OFF
      }),
    ),
  );
}
