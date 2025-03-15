import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/theme/spacing.dart';
import 'package:fidefund/theme/typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      headlineLarge: AppTypography.heading1,
      headlineMedium: AppTypography.heading2,
      headlineSmall: AppTypography.heading3,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.caption,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: AppColors.white,
      titleTextStyle: AppTypography.heading1,
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