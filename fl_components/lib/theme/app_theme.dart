import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo;
  static const double elevation = 0;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(color: primaryColor, elevation: elevation),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primaryColor)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor, elevation: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppTheme.primaryColor,
        shape: const StadiumBorder(),
        elevation: 0)));

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(color: primaryColor, elevation: elevation),
      scaffoldBackgroundColor: Colors.black);
}
