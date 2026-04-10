import 'package:flutter/material.dart';

/// Kumpulan warna dasar untuk Design System TCoreUI.
/// Kelas ini tidak boleh diinisiasi (abstract).
abstract class TColors {
  // --- Primary (Brand Colors) ---
  /// Warna utama aplikasi (Misal: Hijau tua untuk kesan finansial yang stabil)
  static const Color primary = Color(0xFF2E7D32);
  static const Color primaryLight = Color(0xFF60AD5E);
  static const Color primaryDark = Color(0xFF005005);

  // --- Semantic Colors (Status) ---
  /// Digunakan untuk pemasukan atau status sukses
  static const Color success = Color(0xFF4CAF50);
  /// Digunakan untuk pengeluaran, error, atau aksi destruktif (hapus)
  static const Color danger = Color(0xFFD32F2F);
  /// Digunakan untuk peringatan
  static const Color warning = Color(0xFFFBC02D);
  /// Digunakan untuk informasi umum
  static const Color info = Color(0xFF1976D2);

  // --- Neutral Colors (Backgrounds & Surfaces) ---
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;

  // --- Text Colors ---
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textInverse = Colors.white;
}