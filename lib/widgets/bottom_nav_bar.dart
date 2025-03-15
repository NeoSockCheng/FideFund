import 'package:fidefund/theme/colors.dart';
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
    return BottomNavigationBar(
      fixedColor: AppColors.primaryBlue,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(icon: Image.asset('assets/icons/icon_home.png', width: 24) , label: 'Home'),
        BottomNavigationBarItem(icon: Image.asset('assets/icons/icon_donate.png', width: 24), label: 'Donate'),
        BottomNavigationBarItem(icon: Image.asset('assets/icons/icon_real_time.png', width: 24), label: 'Real Time'),
        BottomNavigationBarItem(icon: Image.asset('assets/icons/icon_milestone.png', width: 24), label: 'Milestone'),
        BottomNavigationBarItem(icon: Image.asset('assets/icons/icon_profile.png', width: 24), label: 'Profile'),
      ],
    );
  }
}
