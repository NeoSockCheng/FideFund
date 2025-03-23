import 'package:fidefund/screens/charity/charity_release_payment_screen.dart';
import 'package:fidefund/screens/charity/charity_profile_screen.dart';
import 'package:fidefund/screens/charity/charity_home_screen.dart';
import 'package:fidefund/utils/app_strings.dart';
import 'package:fidefund/widgets/app_bar.dart';
import 'package:fidefund/widgets/charity_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class CharityMain extends StatefulWidget {
  const CharityMain({super.key});

  @override
  State<CharityMain> createState() => _CharityMainState();
}

class _CharityMainState extends State<CharityMain> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    CharityHomePage(),
    CharityReleasePaymentPage(),
    CharityProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _shouldShowAppBar()
              ? const CustomAppBar(title: AppStrings.appName)
              : null,
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  bool _shouldShowAppBar() {
    return _currentIndex > 0 && _currentIndex < 2;
  }
}
