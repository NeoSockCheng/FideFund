import 'package:fidefund/models/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/screens/milestone/milestone_details_screen.dart';

class ImpactReportCard extends StatelessWidget {
  final Campaign report;  
  const ImpactReportCard({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)],
        color: Colors.white,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(report.coverImage, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(report.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("${report.createdAt.day}/${report.createdAt.month}/${report.createdAt.year}", textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                SizedBox(height: 20),
                
                // Updated ElevatedButton to navigate on click
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MilestoneDetailsPage(report: report),
                      ),
                    );
                  },
                  child: Text("Read More", style: TextStyle(color: AppColors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
