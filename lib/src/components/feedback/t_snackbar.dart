import 'package:flutter/material.dart';
import '../../foundations/t_colors.dart';
import '../../foundations/t_typography.dart';
import '../../foundations/t_spacing.dart';

enum TSnackbarVariant { success, error, info }

class TSnackbar {
  static void show(
      BuildContext context, {
        required String message,
        TSnackbarVariant variant = TSnackbarVariant.info,
      }) {
    Color backgroundColor;
    IconData icon;

    switch (variant) {
      case TSnackbarVariant.success:
        backgroundColor = TColors.success;
        icon = Icons.check_circle_outline;
        break;
      case TSnackbarVariant.error:
        backgroundColor = TColors.danger;
        icon = Icons.error_outline;
        break;
      case TSnackbarVariant.info:
        backgroundColor = TColors.textPrimary;
        icon = Icons.info_outline;
        break;
    }

    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(TSpacing.md),
      content: Row(
        children: [
          Icon(icon, color: TColors.textInverse, size: 20),
          const SizedBox(width: TSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: TTypography.bodyMedium.copyWith(color: TColors.textInverse),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}