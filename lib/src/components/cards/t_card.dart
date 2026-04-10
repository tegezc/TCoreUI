import 'package:flutter/material.dart';
import '../../foundations/t_colors.dart';
import '../../foundations/t_spacing.dart';

/// Wadah standar untuk menampilkan kelompok data atau informasi.
class TCard extends StatelessWidget {
  /// Konten utama di dalam card
  final Widget child;

  /// Jarak isi di dalam card (Default: TSpacing.md / 16.0)
  final EdgeInsetsGeometry? padding;

  /// Warna latar card (Default: TColors.surface / Putih)
  final Color? backgroundColor;

  /// Aksi ketika card ditekan (Opsional, berguna untuk list transaksi)
  final VoidCallback? onTap;

  const TCard({
    super.key,
    required this.child,
    this.padding,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Desain Inti Card
    Widget cardContent = Container(
      width: double.infinity, // Secara default mengisi lebar layar
      padding: padding ?? const EdgeInsets.all(TSpacing.md),
      decoration: BoxDecoration(
        color: backgroundColor ?? TColors.surface,
        borderRadius: BorderRadius.circular(12.0),

        // 2. Bayangan Halus (Soft Shadow)
        // Kita tidak memakai shadow bawaan Material Card karena seringkali
        // terlalu gelap atau kaku untuk desain modern masa kini.
        boxShadow: [
          BoxShadow(
            color: TColors.textPrimary.withValues(alpha: 0.05), // Sangat tipis
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],

        // 3. Border Sangat Tipis
        // Membantu memisahkan card dari background jika background-nya terang
        border: Border.all(
          color: TColors.textDisabled.withValues(alpha: 0.2),
          width: 1.0,
        ),
      ),
      child: child,
    );

    // 4. Bungkus dengan Interaktivitas (Jika onTap diisi)
    if (onTap != null) {
      return Material(
        color: Colors.transparent, // Material diperlukan agar efek ripple terlihat
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.0),
          // Efek sentuhan warna primer yang sangat pudar
          highlightColor: TColors.primary.withValues(alpha: 0.05),
          splashColor: TColors.primary.withValues(alpha: 0.1),
          child: cardContent,
        ),
      );
    }

    return cardContent;
  }
}