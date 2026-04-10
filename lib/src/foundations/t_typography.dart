import 'package:flutter/material.dart';
import 't_colors.dart'; // Kita panggil TColors untuk warna default teks

/// Kumpulan standar gaya teks (Typography) untuk TCoreUI.
abstract class TTypography {
  // --- Font Weights (Ketebalan) ---
  /// Gunakan ini alih-alih memanggil FontWeight.w... secara langsung
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // --- Headings / Titles (Untuk Judul Halaman atau Section) ---

  /// Judul halaman utama (Sangat Besar)
  static const TextStyle heading1 = TextStyle(
    fontSize: 32.0,
    fontWeight: bold,
    color: TColors.textPrimary,
    letterSpacing: -1.0,
  );

  /// Judul section/kartu utama
  static const TextStyle heading2 = TextStyle(
    fontSize: 24.0,
    fontWeight: bold,
    color: TColors.textPrimary,
    letterSpacing: -0.5,
  );

  /// Sub-judul
  static const TextStyle heading3 = TextStyle(
    fontSize: 20.0,
    fontWeight: semiBold,
    color: TColors.textPrimary,
  );

  // --- Body Text (Untuk paragraf dan teks konten utama) ---

  /// Teks paragraf besar / teks input form
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: regular,
    color: TColors.textPrimary,
  );

  /// Teks standar aplikasi (Default)
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: regular,
    color: TColors.textPrimary,
  );

  /// Teks paragraf kecil
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
    fontWeight: regular,
    color: TColors.textSecondary,
  );

  // --- Labels (Untuk Tombol, Badge, dan Caption) ---

  /// Teks di dalam tombol utama
  static const TextStyle button = TextStyle(
    fontSize: 14.0,
    fontWeight: semiBold,
    color: TColors.textInverse, // Putih, karena biasanya tombol berwarna gelap
    letterSpacing: 0.5,
  );

  /// Teks sangat kecil untuk caption, keterangan waktu, atau tag
  static const TextStyle caption = TextStyle(
    fontSize: 10.0,
    fontWeight: medium,
    color: TColors.textSecondary,
  );
}