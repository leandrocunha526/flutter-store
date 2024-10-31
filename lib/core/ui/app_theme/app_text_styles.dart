import 'package:flutter/material.dart';

class AppTextStyles {
  final Color? color;
  final FontWeight weight;
  static const String _fontFamily = 'DMSans';
  AppTextStyles({this.weight = FontWeight.w500, this.color});

  TextStyle _createTextStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      color: color,
      fontFamily: _fontFamily,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
    );
  }
  // Em ordem alfabética
  TextStyle get huge => _createTextStyle(24, weight);
  TextStyle get large => _createTextStyle(18, weight);
  TextStyle get larger => _createTextStyle(20, weight);
  TextStyle get medium => _createTextStyle(16, weight);
  TextStyle get small => _createTextStyle(14, weight);
  TextStyle get smaller => _createTextStyle(12, weight);
  TextStyle get tiny => _createTextStyle(10, weight);
}
