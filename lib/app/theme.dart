import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF3978F6);
  static const Color lightBackground = Color(0xFFF7F9FD);
  static const Color darkBackground = Color(0xFF101522);
  static const Color darkCard = Color(0xFF1B2638);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackground,
      foregroundColor: Color(0xFF172033),
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardColor: darkCard,
  );
}
