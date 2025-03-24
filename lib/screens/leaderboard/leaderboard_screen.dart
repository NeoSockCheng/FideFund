import 'package:fidefund/controllers/donor_controller.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/utils/app_images.dart';
import 'package:fidefund/widgets/app_bar.dart';
import 'package:fidefund/widgets/circle_avatar.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;
  int _gradientIndex = 0;

  final List<List<Color>> _gradientColors = [
    [AppColors.softBlue, AppColors.mistyBlue],
    [AppColors.darkBlue, AppColors.primaryBlue],
    [AppColors.softBlue, AppColors.mistyBlue],
  ];

  final List<Map<String, dynamic>> donors = DonorController.getDonorRank();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _gradientIndex = (_gradientIndex + 1) % _gradientColors.length;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _gradientColors[_gradientIndex],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: "Top Contributors",
                backgroundColor: Colors.transparent,
                showShadow: false,
                centerTitle: true,
                fontColor: AppColors.white,
              ),
              const SizedBox(height: 10),
              _buildTop3(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [SizedBox(width: 50)]),
              ),
              const SizedBox(height: 10),
              Expanded(child: _buildLeaderboardList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTop3() {
    if (donors.length < 3) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildTopDonor(2, 28),
          _buildTopDonor(1, 34),
          _buildTopDonor(3, 24),
        ],
      ),
    );
  }

  Widget _buildTopDonor(int position, double radius) {
    final donor = donors[position - 1];
    final amount = donor['amount'];

    return Expanded(
      child: Column(
        children: [
          _buildPositionBadge(position),
          const SizedBox(height: 10),
          CustomCircularAvatar(
            radius: radius,
            imagePath: donor['profileImage'] ?? AppImages.image_placeholder,
          ),
          const SizedBox(height: 10),
          Text(
            donor['username'],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            "MYR $amount",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPositionBadge(int position) {
    if (position == 1) {
      return const Icon(Icons.emoji_events, color: Colors.amber, size: 25);
    } else {
      Color badgeColor =
          position == 2 ? const Color(0xFFC0C0C0) : const Color(0xFFCD7F32);
      return CircleAvatar(
        backgroundColor: badgeColor,
        radius: 12,
        child: Text("$position", style: const TextStyle(color: Colors.white)),
      );
    }
  }

  Widget _buildLeaderboardList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: donors.length - 3,
      itemBuilder: (context, index) {
        final donorIndex = index + 3;
        final donor = donors[donorIndex];
        final rank = donorIndex + 1;
        final amount = donor['amount'];

        return Card(
          color: AppColors.secondaryBlue.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("#$rank", style: const TextStyle(color: Colors.white)),
                const SizedBox(width: 8), 
                CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 16,
                  backgroundImage: AssetImage(donor['profileImage']),
                ),
              ],
            ),
            title: Text(donor['username'], style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)),
            trailing: Text(
              "MYR $amount",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        );
      },
    );
  }
}
