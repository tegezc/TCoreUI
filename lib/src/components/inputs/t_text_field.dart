import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../foundations/t_colors.dart';
import '../../foundations/t_spacing.dart';
import '../../foundations/t_typography.dart';

class TTextField extends StatelessWidget {
  /// Label teks di atas form
  final String label;

  /// Teks petunjuk (placeholder) di dalam form
  final String? hintText;

  /// Controller untuk mengambil value teks
  final TextEditingController? controller;

  /// Jenis keyboard (Teks, Angka, Email, dll)
  final TextInputType keyboardType;

  /// Ikon di sebelah kiri (Misal: Rp, atau Icon User)
  final Widget? prefixIcon;

  /// Ikon di sebelah kanan (Misal: Icon Mata untuk password)
  final Widget? suffixIcon;

  /// Fungsi validasi (Mengembalikan string error jika tidak valid)
  final String? Function(String?)? validator;

  /// Format input khusus (Misal: pemisah ribuan otomatis)
  final List<TextInputFormatter>? inputFormatters;

  /// Apakah teks disembunyikan (untuk password)
  final bool obscureText;

  /// Jumlah baris maksimal (jika ingin membuat form catatan/textarea)
  final int maxLines;

  const TTextField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.inputFormatters,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Label Form Eksternal
        Text(
          label,
          style: TTypography.bodyMedium.copyWith(
            fontWeight: TTypography.semiBold,
          ),
        ),
        const SizedBox(height: TSpacing.sm), // Jarak standar 8.0

        // 2. Inti Input Form
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : maxLines, // Password harus 1 baris
          validator: validator,
          inputFormatters: inputFormatters,
          style: TTypography.bodyLarge,
          cursorColor: TColors.primary,

          // 3. Dekorasi Form
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TTypography.bodyLarge.copyWith(
              color: TColors.textDisabled,
            ),
            filled: true,
            fillColor: TColors.surface, // Background form putih/bersih
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            // Padding di dalam form
            contentPadding: const EdgeInsets.symmetric(
              horizontal: TSpacing.md,
              vertical: TSpacing.md,
            ),

            // Border saat normal
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: TColors.textDisabled,
                width: 1.0,
              ),
            ),

            // Border saat form ditekan (aktif)
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: TColors.primary,
                width: 2.0,
              ),
            ),

            // Border saat ada error validasi
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: TColors.danger,
                width: 1.5,
              ),
            ),

            // Border saat form ditekan tapi statusnya error
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: TColors.danger,
                width: 2.0,
              ),
            ),

            // Style teks error di bawah form
            errorStyle: TTypography.caption.copyWith(
              color: TColors.danger,
            ),
          ),
        ),
      ],
    );
  }
}