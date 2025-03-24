import 'package:fidefund/screens/donate/donate_screen.dart';
import 'package:fidefund/screens/home/home_screen.dart';
import 'package:fidefund/screens/leaderboard/leaderboard_screen.dart';
import 'package:fidefund/screens/milestone/milestone_screen.dart';
import 'package:fidefund/screens/profile/profile_screen.dart';
import 'package:fidefund/screens/real_time/real_time_screen.dart';
import 'package:fidefund/utils/app_strings.dart';
import 'package:fidefund/widgets/app_bar.dart';
import 'package:fidefund/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    DonatePage(),
    RealTimePage(),
    LeaderboardScreen(),
    MilestonePage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _shouldShowAppBar() ? const CustomAppBar(title: AppStrings.appName) : null,
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  bool _shouldShowAppBar() {
    return _currentIndex > 0 && _currentIndex < 5 && _currentIndex != 3;
  }
}

