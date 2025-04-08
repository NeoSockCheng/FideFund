import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/theme/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color backgroundColor;
  final bool showShadow;
  final bool centerTitle;
  final Color fontColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.actions,
    this.backgroundColor = AppColors.secondaryBlue,
    this.fontColor = AppColors.black,
    this.showShadow = true,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTypography.bodyLarge.copyWith(color: fontColor),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: showShadow ? 6 : 0, 
      shadowColor: showShadow ? Colors.black.withAlpha(70) : Colors.transparent,
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
