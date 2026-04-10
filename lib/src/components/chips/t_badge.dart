import 'package:flutter/material.dart';
import '../../foundations/t_colors.dart';
import '../../foundations/t_spacing.dart';
import '../../foundations/t_typography.dart';

enum TBadgeVariant { primary, success, danger, warning, neutral }

class TBadge extends StatelessWidget {
  final String label;
  final TBadgeVariant variant;
  final IconData? icon;

  const TBadge({
    super.key,
    required this.label,
    this.variant = TBadgeVariant.neutral,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    // 1. Logika Warna Berdasarkan Variant
    switch (variant) {
      case TBadgeVariant.primary:
        backgroundColor = TColors.primary.withValues(alpha: 0.1);
        textColor = TColors.primary;
        break;
      case TBadgeVariant.success:
        backgroundColor = TColors.success.withValues(alpha: 0.1);
        textColor = TColors.success;
        break;
      case TBadgeVariant.danger:
        backgroundColor = TColors.danger.withValues(alpha: 0.1);
        textColor = TColors.danger;
        break;
      case TBadgeVariant.warning:
        backgroundColor = TColors.warning.withValues(alpha: 0.1);
        textColor = TColors.warning;
        break;
      case TBadgeVariant.neutral:
        backgroundColor = TColors.textDisabled.withValues(alpha: 0.2);
        textColor = TColors.textSecondary;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSpacing.sm,
        vertical: TSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4.0), // Badge biasanya agak kotak/rounded sedikit
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            label.toUpperCase(), // Biasanya badge menggunakan uppercase agar lebih standout
            style: TTypography.caption.copyWith(
              color: textColor,
              fontWeight: TTypography.bold,
            ),
          ),
        ],
      ),
    );
  }
}