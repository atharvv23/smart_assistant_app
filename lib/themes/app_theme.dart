import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF7C4DFF);
  static const Color primaryLight = Color(0xFF9E6FFF);
  static const Color primaryDark = Color(0xFF5E35B1);
  static const Color accent = Color(0xFF00E5CC);
  static const Color background = Color(0xFFF8F7FF);
  static const Color surface = Colors.white;
  static const Color userBubble = Color(0xFF7C4DFF);
  static const Color assistantBubble = Color(0xFFF0EDFF);
  static const Color textPrimary = Color(0xFF1A1033);
  static const Color textSecondary = Color(0xFF6B7280);

  // Dark mode colors
  static const Color darkBackground = Color(0xFF0F0E1A);
  static const Color darkSurface = Color(0xFF1C1B2E);
  static const Color darkCard = Color(0xFF252438);
  static const Color darkTextPrimary = Color(0xFFF0EEFF);
  static const Color darkTextSecondary = Color(0xFF9E9BB5);
  static const Color darkAssistantBubble = Color(0xFF252438);

  static const Color primaryColor = primary;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: background,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: darkTextPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}