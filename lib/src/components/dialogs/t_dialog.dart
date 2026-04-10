import 'package:flutter/material.dart';
import '../../foundations/t_colors.dart';
import '../../foundations/t_spacing.dart';
import '../../foundations/t_typography.dart';
import '../buttons/t_button.dart'; // Kita gunakan batu bata sebelumnya

/// Menentukan jenis dialog untuk mengatur icon dan warna tombol secara otomatis
enum TDialogVariant { success, danger, warning, info }

class TDialog extends StatelessWidget {
  final String title;
  final String description;
  final TDialogVariant variant;

  final String primaryButtonText;
  final VoidCallback onPrimaryPressed;

  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;

  const TDialog._({ // Constructor dibuat private agar dipanggil lewat TDialog.show()
    required this.title,
    required this.description,
    required this.variant,
    required this.primaryButtonText,
    required this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
  });

  /// Fungsi Helper (Pintu Masuk Utama) agar pemanggilan di aplikasi lebih singkat.
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String description,
    TDialogVariant variant = TDialogVariant.info,
    required String primaryButtonText,
    required VoidCallback onPrimaryPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryPressed,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: variant != TDialogVariant.danger, // Bahaya = harus klik tombol
      builder: (BuildContext context) {
        return TDialog._(
          title: title,
          description: description,
          variant: variant,
          primaryButtonText: primaryButtonText,
          onPrimaryPressed: onPrimaryPressed,
          secondaryButtonText: secondaryButtonText,
          onSecondaryPressed: onSecondaryPressed,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Logika Tampilan Berdasarkan Variant
    IconData iconData;
    Color iconColor;
    TButtonVariant primaryButtonVariant;


    switch (variant) {
      case TDialogVariant.success:
        iconData = Icons.check_circle_outline;
        iconColor = TColors.success;
        primaryButtonVariant = TButtonVariant.primary;
        break;
      case TDialogVariant.danger:
        iconData = Icons.error_outline;
        iconColor = TColors.danger;
        primaryButtonVariant = TButtonVariant.danger;
        break;
      case TDialogVariant.warning:
        iconData = Icons.warning_amber_rounded;
        iconColor = TColors.warning;
        primaryButtonVariant = TButtonVariant.primary;
        break;
      case TDialogVariant.info:
        iconData = Icons.info_outline;
        iconColor = TColors.info;
        primaryButtonVariant = TButtonVariant.primary;
        break;
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Melengkung modern
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(TSpacing.lg),
        decoration: BoxDecoration(
          color: TColors.surface,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Sesuaikan tinggi dengan konten
          children: [
            // 2. Ikon Dialog
            Icon(iconData, size: 64, color: iconColor),
            const SizedBox(height: TSpacing.md),

            // 3. Judul
            Text(
              title,
              style: TTypography.heading3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSpacing.sm),

            // 4. Deskripsi
            Text(
              description,
              style: TTypography.bodyMedium.copyWith(color: TColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSpacing.lg),

            // 5. Area Tombol Aksi
            Row(
              children: [
                // Tombol Batal (Jika ada)
                if (secondaryButtonText != null) ...[
                  Expanded(
                    child: TButton(
                      text: secondaryButtonText!,
                      variant: TButtonVariant.outlined,
                      onPressed: onSecondaryPressed ?? () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: TSpacing.sm),
                ],

                // Tombol Utama
                Expanded(
                  child: TButton(
                    text: primaryButtonText,
                    variant: primaryButtonVariant,
                    onPressed: onPrimaryPressed,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}