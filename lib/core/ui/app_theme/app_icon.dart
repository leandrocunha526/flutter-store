import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_icons.dart';

class AppIcon extends StatelessWidget {
  final String? icon;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Function()? onTap;
  final Color? color;

  const AppIcon({
    super.key,
    this.icon,
    this.color,
    this.fit,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height ?? 20,
        width: width ?? 20,
        child: SvgPicture.asset(
          icon ?? AppIcons.home,
          fit: fit ?? BoxFit.contain,
          // ignore: deprecated_member_use
          color: color,
          width: width ?? 20,
          height: height ?? 20,
        ),
      ),
    );
  }
}
