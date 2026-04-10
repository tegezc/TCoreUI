import 'package:flutter/material.dart';
import '../../foundations/t_colors.dart';
import '../../foundations/t_spacing.dart';
import '../../foundations/t_typography.dart';

/// Enum untuk mendefinisikan variasi tampilan tombol
enum TButtonVariant { primary, outlined, danger }

/// Enum untuk mendefinisikan ukuran tombol
enum TButtonSize { small, medium, large }

class TButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TButtonVariant variant;
  final TButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  const TButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = TButtonVariant.primary,
    this.size = TButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true, // Default true karena tombol di app finance seringkali full-width
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Logika Warna berdasarkan Variant
    Color backgroundColor;
    Color textColor;
    Color? borderColor;

    switch (variant) {
      case TButtonVariant.primary:
        backgroundColor = TColors.primary;
        textColor = TColors.textInverse;
        break;
      case TButtonVariant.danger:
        backgroundColor = TColors.danger;
        textColor = TColors.textInverse;
        break;
      case TButtonVariant.outlined:
        backgroundColor = Colors.transparent;
        textColor = TColors.primary;
        borderColor = TColors.primary;
        break;
    }

    // Jika tombol di-disable (onPressed null atau sedang loading)
    if (onPressed == null || isLoading) {
      backgroundColor = TColors.textDisabled.withValues(alpha: 0.3);
      textColor = TColors.textDisabled;
      borderColor = null;
    }

    // 2. Logika Ukuran (Padding)
    EdgeInsetsGeometry padding;
    switch (size) {
      case TButtonSize.small:
        padding = const EdgeInsets.symmetric(
            vertical: TSpacing.sm,
            horizontal: TSpacing.md
        );
        break;
      case TButtonSize.medium:
        padding = const EdgeInsets.symmetric(
            vertical: 14.0, // Custom sedikit agar lebih enak ditekan
            horizontal: TSpacing.lg
        );
        break;
      case TButtonSize.large:
        padding = const EdgeInsets.symmetric(
            vertical: TSpacing.md,
            horizontal: TSpacing.xl
        );
        break;
    }

    // 3. Merakit Komponen (Batu Bata)
    Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: textColor,
            ),
          ),
          const SizedBox(width: TSpacing.sm),
        ] else if (icon != null) ...[
          Icon(icon, size: 20, color: textColor),
          const SizedBox(width: TSpacing.sm),
        ],
        Text(
          text,
          style: TTypography.button.copyWith(color: textColor),
        ),
      ],
    );

    // Jika isFullWidth, bungkus dengan Center agar Row bisa melebar maksimal
    if (isFullWidth) {
      buttonContent = Center(child: buttonContent);
    }

    // 4. Return Elemen Utama (ElevatedButton)
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0, // Matikan shadow bawaan agar modern
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: borderColor != null
              ? BorderSide(color: borderColor, width: 1.5)
              : BorderSide.none,
        ),
      ),
      child: buttonContent,
    );
  }
}