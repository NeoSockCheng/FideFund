import 'dart:async';
import 'dart:math';
import 'package:fidefund/controllers/donation_controller.dart';
import 'package:fidefund/models/donation_model.dart';
import 'package:fidefund/screens/real_time/real_time_bottom.dart/recent_transaction_item.dart';
import 'package:flutter/material.dart';

class DonationBubbleList extends StatefulWidget {
  final double height;

  const DonationBubbleList({Key? key, this.height = 380.0}) : super(key: key);

  @override
  _DonationBubbleListState createState() => _DonationBubbleListState();
}

class _DonationBubbleListState extends State<DonationBubbleList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<Donation> _donation = DonationController.mockDonation;
  late List<Donation> _allDonation = DonationController.mockDonation;

  Timer? _timer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _donation = List.from(_allDonation.take(3));
    _startMockDonations();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startMockDonations() {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      addDonation(_allDonation[_random.nextInt(_allDonation.length)]);
    });
  }

  void addDonation(Donation donation) {
    setState(() {
      if (_donation.length >= 3) {
        _removeOldestDonation();
      }
      _donation.insert(0, donation);
      _listKey.currentState?.insertItem(
        0,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  void _removeOldestDonation() {
    _listKey.currentState?.removeItem(
      _donation.length - 1,
      (context, animation) => _buildDonationBubble(_donation.last, animation),
      duration: const Duration(milliseconds: 300),
    );
    _donation.removeLast();
  }

  Widget _buildDonationBubble(Donation donation, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RecentDonationBubble(donation: donation),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        height: widget.height,
        child: AnimatedList(
          key: _listKey,
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          initialItemCount: _donation.length,
          itemBuilder: (context, index, animation) {
            return _buildDonationBubble(_donation[index], animation);
          },
        ),
      ),
    );
  }
}
