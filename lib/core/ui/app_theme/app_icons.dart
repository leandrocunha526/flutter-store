import 'package:flutter/material.dart';

import 'app_icon.dart';

class AppIcons {
  static const path = "assets/icons";
  static const announce = "$path/announce.svg";
  static const categories = "$path/categories.svg";
  static const favorite = "$path/favorite.svg";
  static const home = "$path/home.svg";
  static const user = "$path/user.svg";
}

extension AppIconsExtension on String {
  AppIcon icon({
    String? icon,
    Color? color,
    BoxFit? fit,
    double? height,
    double? width,
    Function()? onTap,
  }) {
    return AppIcon(
      icon: this,
      color: color,
      fit: fit,
      width: width,
      height: height,
      onTap: onTap,
    );
  }
}
