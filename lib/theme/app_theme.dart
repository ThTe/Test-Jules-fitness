import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor
  AppTheme._();

  static const Color primaryColor = Colors.teal;
  static const Color accentColor = Colors.amber;
  static const Color textColor = Colors.black87;
  static const Color lightTextColor = Colors.grey;

  static ThemeData get themeData {
    return ThemeData(
      primarySwatch: primaryColor as MaterialColor? ?? Colors.teal,
      scaffoldBackgroundColor: Colors.grey[50],
      fontFamily: 'Roboto', // A nice, standard font

      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
      ),

      cardTheme: CardTheme(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      textTheme: const TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
        bodyMedium: TextStyle(color: textColor, fontSize: 16),
        bodySmall: TextStyle(color: lightTextColor, fontSize: 12),
      ),
    );
  }
}
