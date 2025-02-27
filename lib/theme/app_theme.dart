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
  );
}
