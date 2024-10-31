import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double size;
  final double width;
  final double height;
  final double borderRadius;
  final Color baseColor;
  final Color highlightColor;
  final BoxShape shapeBorder;

  const ShimmerWidget.circular({
    super.key,
    this.highlightColor = const Color(0xFFF1F2F3),
    this.baseColor = const Color(0xFFDBDDE1),
    required this.size,
  })  : shapeBorder = BoxShape.circle,
        borderRadius = 0,
        height = size,
        width = size;

  const ShimmerWidget.rectangular({
    super.key,
    this.highlightColor = const Color(0xFFb3d7da),
    this.baseColor = const Color(0xFF99c9ce),
    this.width = double.infinity,
    this.borderRadius = 30,
    required this.height,
  })  : shapeBorder = BoxShape.rectangle,
        size = height;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        highlightColor: highlightColor,
        baseColor: baseColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: baseColor,
            shape: shapeBorder,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      );
}
