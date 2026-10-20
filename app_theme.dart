import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFF2E7D6B);
  static const Color accent = Color(0xFFFFB703);
  static const Color background = Color(0xFFF7FAF8);
  static const Color text = Color(0xFF1F2933);

  /// Har bir sinf uchun alohida rang (1, 2, 3, 4).
  static const List<Color> gradeColors = [
    Color(0xFFEF476F),
    Color(0xFF118AB2),
    Color(0xFF06A77D),
    Color(0xFFF4A100),
  ];

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: background,
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: text,
              displayColor: text,
            ),
      );
}
