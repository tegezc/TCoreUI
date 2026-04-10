import 'package:flutter/material.dart';
import '../foundations/t_colors.dart';
import '../foundations/t_typography.dart';

/// Kelas ini mengelola konfigurasi tema global untuk aplikasi.
abstract class TTheme {

  /// Tema Terang (Light Mode)
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: TColors.background,

      // 1. Pemetaan Warna Global
      colorScheme: const ColorScheme.light(
        primary: TColors.primary,
        onPrimary: TColors.textInverse,
        secondary: TColors.primaryLight,
        error: TColors.danger,
        surface: TColors.surface,
        onSurface: TColors.textPrimary,
      ),

      // 2. Pemetaan Tipografi Global
      // Ini adalah "cheat code". Dengan memetakan TTypography ke TextTheme bawaan Material,
      // semua widget bawaan Flutter otomatis akan menggunakan font kita.
      textTheme: const TextTheme(
        displayLarge: TTypography.heading1,
        displayMedium: TTypography.heading2,
        displaySmall: TTypography.heading3,
        bodyLarge: TTypography.bodyLarge,
        bodyMedium: TTypography.bodyMedium,
        bodySmall: TTypography.bodySmall,
        labelLarge: TTypography.button,
        labelSmall: TTypography.caption,
      ),

      // 3. Modifikasi Komponen Bawaan (Opsional tapi disarankan)
      // Contoh: Menghilangkan shadow/elevation bawaan dari AppBar agar terlihat lebih modern
      appBarTheme: const AppBarTheme(
        backgroundColor: TColors.primary,
        foregroundColor: TColors.textInverse,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TTypography.heading3,
      ),
    );
  }

// Jika nanti Anda butuh Dark Mode, Anda tinggal membuat getter darkTheme di sini
// static ThemeData get darkTheme { ... }
}