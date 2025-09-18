import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Neon mor + camgöbeği
  static const seed = Color(0xFF7A5CFF);

  static final darkColor = ColorScheme.fromSeed(
    seedColor: seed,
    brightness: Brightness.dark,
  ).copyWith(
    primary: const Color(0xFF8B5CF6),   // buton rengi
    secondary: const Color(0xFF00E5FF), // vurgu
    surface: const Color(0xFF0F1115),
    background: const Color(0xFF0B0D11),
    onSurface: const Color(0xFFE6EAF2),
  );

  static ThemeData dark() {
    final t = ThemeData(
      useMaterial3: true,
      colorScheme: darkColor,
      scaffoldBackgroundColor: darkColor.surface,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: darkColor.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      // Başlıklar daha “dijital”: Orbitron; gövde Inter
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.orbitron(fontWeight: FontWeight.w700),
        headlineMedium: GoogleFonts.orbitron(fontWeight: FontWeight.w700),
        titleLarge: GoogleFonts.orbitron(fontWeight: FontWeight.w600, letterSpacing: 0.5),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: darkColor.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: GoogleFonts.orbitron(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
    return t;
  }
}
