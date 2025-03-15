import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/theme/spacing.dart';
import 'package:fidefund/theme/typography.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    textTheme: const TextTheme(
      headlineLarge: AppTypography.heading1,
      headlineMedium: AppTypography.heading2,
      headlineSmall: AppTypography.heading3,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.caption,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: AppColors.white,
      titleTextStyle: AppTypography.heading2,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.m,
          horizontal: AppSpacing.l,
        ),
        textStyle: AppTypography.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}