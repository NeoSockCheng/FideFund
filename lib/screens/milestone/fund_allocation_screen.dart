import 'package:fidefund/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:fidefund/theme/colors.dart';

class FundAllocationPage extends StatelessWidget {
  FundAllocationPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> fundCategories = [
    {"title": "Education", "percentage": 40, "amount": 40000.00, "icon": Icons.school, "color": AppColors.darkBlue},
    {"title": "Healthcare", "percentage": 30, "amount": 30000.00, "icon": Icons.local_hospital, "color": AppColors.green},
    {"title": "Infrastructure", "percentage": 20, "amount": 20000.00, "icon": Icons.location_city, "color": AppColors.orange},
    {"title": "Community", "percentage": 10, "amount": 10000.00, "icon": Icons.people, "color": AppColors.red},
  ];

  double getTotalFunds() {
    return fundCategories.fold(0, (sum, item) => sum + item["amount"]);
  }

  @override
  Widget build(BuildContext context) {
    double totalFunds = getTotalFunds();

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      appBar: CustomAppBar(
        title: "Fund Allocation",
        backgroundColor: AppColors.primaryBlue,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Fund Allocated",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${totalFunds.toStringAsFixed(2)} MYR",
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat("MMMM yyyy").format(DateTime.now()),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Pie Chart
            SizedBox(
              height: 320,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: fundCategories.map((category) {
                    return PieChartSectionData(
                      color: category["color"],
                      value: category["percentage"].toDouble(),
                      title: "${category["percentage"]}%\n${category["title"]}",
                      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                      radius: 160,
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Fund Categories List
            const Text(
              "Fund Breakdown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: fundCategories.length,
                itemBuilder: (context, index) {
                  return _buildFundCategoryItem(fundCategories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fund Category Item Widget
  Widget _buildFundCategoryItem(Map<String, dynamic> category) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: category["color"],
                child: Icon(category["icon"], color: Colors.white),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category["title"],
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${category["percentage"]}% Allocation",
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "${category["amount"].toStringAsFixed(2)} MYR",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
