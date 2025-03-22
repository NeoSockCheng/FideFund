import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/utils/app_icons.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: onTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            _buildNavItem(AppIcons.iconHome, 0),
            _buildNavItem(AppIcons.iconReleasePayment, 1),
            _buildNavItem(AppIcons.iconProfile, 2),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, int index) {
    return BottomNavigationBarItem(
      icon: ColorFiltered(
        colorFilter: ColorFilter.mode(
          currentIndex == index ? AppColors.darkBlue : AppColors.secondaryBlue,
          BlendMode.srcIn,
        ),
        child: Image.asset(iconPath, width: 24),
      ),
      label: '',
    );
  }
}
