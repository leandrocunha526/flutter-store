import 'package:flutter/material.dart';

class AppImages {
  static const path = "assets/images";
  static const noResults = "$path/rafiki.png";
}

extension AppImageExt on String {
  Widget image({
    double? width,
    double? height,
    BoxFit? fit,
    VoidCallback? onTap,
  }) {
    return InkWell(
        onTap: onTap,
        child: Image.asset(
          this,
          width: width,
          height: height,
          fit: fit,
        ),
    );
  }
}
