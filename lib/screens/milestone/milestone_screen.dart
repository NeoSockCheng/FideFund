import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/screens/milestone/fund_allocation_screen.dart';
import 'package:fidefund/screens/leaderboard/leaderboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/widgets/impact_report_card.dart';

class MilestonePage extends StatefulWidget {
  @override
  _MilestonePageState createState() => _MilestonePageState();
}

class _MilestonePageState extends State<MilestonePage> {
  int currentPage = 0;
  final int itemsPerPage = 4;
  List<Campaign> reports = CampaignController.mockCampaigns;

  @override
  Widget build(BuildContext context) {
    int totalPages = (reports.length / itemsPerPage).ceil();
    List<Campaign> currentReports =
        reports.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImpactSummary(),
            SizedBox(height: 30),
            _buildActionButtons(),
            SizedBox(height: 30),
            Text(
              "Latest Impact Reports",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildImpactReportsGrid(currentReports),
            SizedBox(height: 10),
            _buildPaginationControls(totalPages),
          ],
        ),
      ),
    );
  }

  /// Impact Summary
  Widget _buildImpactSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Our Impact",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _impactStat("Total Donations", "MYR 200,000"),
            _impactStat("Beneficiaries Helped", "15,000"),
          ],
        ),
        SizedBox(height: 15),
        _impactStat("Campaigns Funded", "168"),
      ],
    );
  }

  Widget _impactStat(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, color: AppColors.grey)),
        Text(
          value,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.darkBlue,
          ),
        ),
      ],
    );
  }

  /// Leaderboard & Fund Breakdown Button Wrapper
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30), 
            child: _buildLeaderboardButton(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: _buildFundBreakdownButton(),
          ),
        ),
      ],
    );
  }

  /// Leaderboard Button
  Widget _buildLeaderboardButton() {
    return _buildEqualSizeButton(
      icon: Icons.leaderboard,
      label: "Donors Leaderboard",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeaderboardScreen()),
        );
      },
    );
  }

  /// Fund Breakdown Button
  Widget _buildFundBreakdownButton() {
    return _buildEqualSizeButton(
      icon: Icons.pie_chart,
      label: "Fund Allocation Breakdown",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FundAllocationPage()),
        );
      },
    );
  }

  /// Generic Button with Equal Size
  Widget _buildEqualSizeButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return IntrinsicHeight(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBlue,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.yellow, size: 45),
            SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }


  /// Impact Reports GridView
  Widget _buildImpactReportsGrid(List<Campaign> currentReports) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(), 
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250, 
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.6, 
      ),
      itemCount: currentReports.length,
      itemBuilder: (context, index) {
      final report = currentReports[index];
      return ImpactReportCard(report: report);
      },
    );
  }

  /// Pagination Controls (Next & Previous Buttons)
  Widget _buildPaginationControls(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: currentPage > 0 ? AppColors.darkBlue : Colors.grey,
          ),
          onPressed: currentPage > 0
              ? () {
                  setState(() {
                    currentPage--;
                  });
                }
              : null, 
        ),
        SizedBox(width: 20),
        Text(
          "${currentPage + 1} / $totalPages",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20),
        IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color:
                currentPage < totalPages - 1 ? AppColors.darkBlue : Colors.grey,
          ),
          onPressed: currentPage < totalPages - 1
              ? () {
                  setState(() {
                    currentPage++;
                  });
                }
              : null,
        ),
      ],
    );
  }
}
