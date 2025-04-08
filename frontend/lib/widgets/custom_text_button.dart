import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/theme/typography.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;
  final bool iconAtStart; // true = icon before text, false = icon after text

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.icon,
    this.iconAtStart = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && iconAtStart) ...[
            Icon(icon, size: fontSize + 2, color: color ?? AppColors.darkBlue),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTypography.textStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color ?? AppColors.darkBlue,
            ),
          ),
          if (icon != null && !iconAtStart) ...[
            const SizedBox(width: 4),
            Icon(icon, size: fontSize + 2, color: color ?? AppColors.darkBlue),
          ],
        ],
      ),
    );
  }
}
