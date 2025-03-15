import 'package:flutter/material.dart';
import 'colors.dart';

class AppTypography {
  static const String fontFamily = 'OpenSans';

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  static TextStyle textStyle({
    required double fontSize,
    FontWeight fontWeight = regular,
    Color color = AppColors.black,
    FontStyle fontStyle = FontStyle.normal,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
  
  static final TextStyle heading1 = textStyle(fontSize: 32, fontWeight: bold);
  static final TextStyle heading2 = textStyle(fontSize: 24, fontWeight: semiBold);
  static final TextStyle heading3 = textStyle(fontSize: 20, fontWeight: semiBold);
  static final TextStyle bodyLarge = textStyle(fontSize: 18, fontWeight: medium);
  static final TextStyle bodyMedium = textStyle(fontSize: 16, fontWeight: regular);
  static final TextStyle bodySmall = textStyle(fontSize: 14, fontWeight: light);
  static final TextStyle caption = textStyle(fontSize: 12, fontWeight: light, fontStyle: FontStyle.italic, color: AppColors.grey);
  static final TextStyle button = textStyle(fontSize: 16, fontWeight: bold, color: AppColors.white);
}
