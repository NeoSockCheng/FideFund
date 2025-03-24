import 'package:fidefund/controllers/donation_controller.dart';
import 'package:fidefund/screens/real_time/real_time_all_donations/real_time_all_donations_item.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/models/donation_model.dart';

class RealTimeAllDonations extends StatefulWidget {
  const RealTimeAllDonations({super.key});

  @override
  State<RealTimeAllDonations> createState() => _RealTimeAllDonationsState();
}

class _RealTimeAllDonationsState extends State<RealTimeAllDonations> {
  final TextEditingController _searchController = TextEditingController();

  final List<Donation> _donations = DonationController.mockDonation;

  List<Donation> _filteredDonations = [];

  @override
  void initState() {
    super.initState();
    _filteredDonations = _donations;
  }

  void _filterDonations(String query) {
    setState(() {
      _filteredDonations = _donations
          .where((donation) =>
              "${donation.amount} ${donation.currency}".toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 8),
                const Text(
                  'All Donations',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBarWidget(
              controller: _searchController,
              onFilterPressed: () {},
              onChanged: _filterDonations,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDonations.length,
              itemBuilder: (context, index) {
                final sortedDonations = _filteredDonations
                  ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
                return RealTimeAllDonationsItem(donations: sortedDonations[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}