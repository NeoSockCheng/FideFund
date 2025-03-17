import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/widgets/impact_report_card.dart';
import 'package:fidefund/models/impact_report_model.dart';

class MilestonePage extends StatefulWidget {
  @override
  _MilestonePageState createState() => _MilestonePageState();
}

class _MilestonePageState extends State<MilestonePage> {
  int currentPage = 0;
  final int itemsPerPage = 4;

  final List<ImpactReport> reports = [
    ImpactReport(
      id: "1",
      name: "Saving Stray Dogs in Melaka",
      description: "A campaign to save stray dogs...",
      ownerId: "user123",
      category: "Animal Welfare",
      contributors: 120,
      fundsRaised: 5000,
      goalAmount: 10000,
      image: "../assets/images/impact_reports/straydogs.png",
      date: DateTime(2025, 3, 14),
    ),
    ImpactReport(
      id: "2",
      name: "E-Gadgets for B40 Students",
      description: "Providing gadgets for underprivileged students...",
      ownerId: "user456",
      category: "Education",
      contributors: 200,
      fundsRaised: 8000,
      goalAmount: 15000,
      image: "../assets/images/impact_reports/gadgets.png",
      date: DateTime(2025, 3, 10),
    ),
    ImpactReport(
      id: "3",
      name: "Flood in East Coast Malaysia",
      description: "Flood relief for affected families...",
      ownerId: "user789",
      category: "Disaster Relief",
      contributors: 300,
      fundsRaised: 12000,
      goalAmount: 20000,
      image: "../assets/images/impact_reports/flood.png",
      date: DateTime(2025, 2, 7),
    ),
    ImpactReport(
      id: "4",
      name: "Tree Planting Initiative",
      description: "Planting trees to combat deforestation...",
      ownerId: "user321",
      category: "Environment",
      contributors: 150,
      fundsRaised: 6000,
      goalAmount: 12000,
      image: "../assets/images/impact_reports/trees.png",
      date: DateTime(2025, 1, 25),
    ),
    ImpactReport(
      id: "5",
      name: "Orphanage Education Support",
      description: "Providing learning materials for orphanages...",
      ownerId: "user654",
      category: "Children",
      contributors: 180,
      fundsRaised: 7000,
      goalAmount: 13000,
      image: "../assets/images/impact_reports/orphanage.png",
      date: DateTime(2025, 3, 5),
    ),
    ImpactReport(
      id: "6",
      name: "Medical Aid for Rural Areas",
      description: "Supplying essential medicine to remote villages...",
      ownerId: "user987",
      category: "Health",
      contributors: 220,
      fundsRaised: 9500,
      goalAmount: 15000,
      image: "../assets/images/impact_reports/medical.png",
      date: DateTime(2025, 2, 28),
    ),
    ImpactReport(
      id: "7",
      name: "Clean Water for Villages",
      description: "Building wells to provide clean drinking water...",
      ownerId: "user555",
      category: "Water & Sanitation",
      contributors: 250,
      fundsRaised: 11000,
      goalAmount: 18000,
      image: "../assets/images/impact_reports/water.png",
      date: DateTime(2025, 2, 15),
    ),
    ImpactReport(
      id: "8",
      name: "Feeding the Homeless",
      description: "Providing meals and shelter for the homeless...",
      ownerId: "user222",
      category: "Social Welfare",
      contributors: 280,
      fundsRaised: 13000,
      goalAmount: 20000,
      image: "../assets/images/impact_reports/homeless.png",
      date: DateTime(2025, 1, 30),
    ),
    ImpactReport(
      id: "9",
      name: "Scholarships for Underprivileged Students",
      description: "Offering scholarships to talented students in need...",
      ownerId: "user777",
      category: "Education",
      contributors: 320,
      fundsRaised: 15000,
      goalAmount: 25000,
      image: "../assets/images/impact_reports/scholarship.png",
      date: DateTime(2025, 1, 20),
    ),
    ImpactReport(
      id: "10",
      name: "Rebuilding Homes After Fire",
      description: "Helping families rebuild after a devastating fire...",
      ownerId: "user999",
      category: "Disaster Relief",
      contributors: 350,
      fundsRaised: 16000,
      goalAmount: 30000,
      image: "../assets/images/impact_reports/rebuild.png",
      date: DateTime(2025, 3, 2),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    int totalPages = (reports.length / itemsPerPage).ceil();
    List<ImpactReport> currentReports = reports.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImpactSummary(),
            SizedBox(height: 30),
            _buildFundBreakdownButton(),
            SizedBox(height: 30),
            Text(
              "Latest Impact Reports",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildImpactReportsGrid(currentReports), 
            SizedBox(height: 20),
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
        Text("Our Impact", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
        Text(value, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.darkBlue)),
      ],
    );
  }

  /// Fund Breakdown Button
  Widget _buildFundBreakdownButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBlue,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.pie_chart, color: AppColors.yellow, size: 45),
            SizedBox(height: 8),
            Text(
              "Fund Allocation Breakdown",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  /// Impact Reports GridView
  Widget _buildImpactReportsGrid(List<ImpactReport> currentReports) {
    return GridView.builder(
      shrinkWrap: true, // Make GridView take only necessary space
      physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
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
          icon: Icon(Icons.arrow_back_ios, color: currentPage > 0 ? AppColors.darkBlue : Colors.grey),
          onPressed: currentPage > 0
              ? () {
                  setState(() {
                    currentPage--;
                  });
                }
              : null, // Disable button if on the first page
        ),
        SizedBox(width: 20),
        Text(
          "${currentPage + 1} / $totalPages",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios, color: currentPage < totalPages - 1 ? AppColors.darkBlue : Colors.grey),
          onPressed: currentPage < totalPages - 1
              ? () {
                  setState(() {
                    currentPage++;
                  });
                }
              : null, // Disable button if on the last page
        ),
      ],
    );
  }
}
