import 'package:fidefund/screens/home/home_screen.dart';
import 'package:fidefund/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Setup',
      theme: AppTheme.theme,
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}