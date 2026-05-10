import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF2563EB), // Blue 600
    brightness: Brightness.light,
    primary: const Color(0xFF2563EB),
    onPrimary: Colors.white,
    secondary: const Color(0xFF10B981), // Emerald 500
    surface: Colors.white,
    background: const Color(0xFFF9FAFB), // Gray 50
    onBackground: const Color(0xFF111827), // Gray 900
    error: const Color(0xFFEF4444), // Red 500
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF111827),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      side: const BorderSide(color: Color(0xFFE5E7EB)),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF3F4F6), // Gray 100
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF111827)),
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF111827)),
    headlineSmall: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF111827)),
    bodyLarge: TextStyle(color: Color(0xFF374151)), // Gray 700
    bodyMedium: TextStyle(color: Color(0xFF4B5563)), // Gray 600
  ),
);
