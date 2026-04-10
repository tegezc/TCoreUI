import 'package:flutter/material.dart';
import '../../foundations/t_colors.dart';

class TShimmer extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const TShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8.0,
  });

  /// Helper untuk membuat Shimmer berbentuk lingkaran (misal untuk icon/avatar)
  const TShimmer.circular({
    super.key,
    required double size,
  })  : width = size,
        height = size,
        borderRadius = size / 2;

  @override
  State<TShimmer> createState() => _TShimmerState();
}

class _TShimmerState extends State<TShimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(); // Mengulang terus menerus
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                _controller.value - 0.3,
                _controller.value,
                _controller.value + 0.3,
              ],
              colors: [
                TColors.textDisabled.withValues(alpha: 0.1),
                TColors.textDisabled.withValues(alpha: 0.3),
                TColors.textDisabled.withValues(alpha: 0.1),
              ],
            ),
          ),
        );
      },
    );
  }
}