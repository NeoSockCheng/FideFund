import 'package:fidefund/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/theme/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color backgroundColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.actions,
    this.backgroundColor = AppColors.secondaryBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTypography.bodyLarge.copyWith(color: AppColors.black),
      ),
      centerTitle: false,
      elevation: 6,
      shadowColor: Colors.black.withAlpha(70), // Use `withAlpha()` instead
      backgroundColor: backgroundColor, // Ensure it takes the right color
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
