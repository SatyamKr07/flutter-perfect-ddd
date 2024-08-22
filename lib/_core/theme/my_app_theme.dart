// lib/app_theme.dart
import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      primarySwatch: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // primary: Colors.deepPurple,
          // onPrimary: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        // bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        // bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // primarySwatch: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // primary: Colors.deepPurple,
          // onPrimary: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        // bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        // bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      ),
    );
  }
}
