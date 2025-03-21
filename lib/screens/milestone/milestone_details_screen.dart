import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/models/milestone_model.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';

class MilestoneDetailsPage extends StatelessWidget {
  final Campaign report;

  const MilestoneDetailsPage({Key? key, required this.report}) : super(key: key);

  int get currentMilestoneIndex {
    return report.milestones.indexWhere((milestone) => !milestone.isComplete);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: AppColors.darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Impact Report", style: TextStyle(color: AppColors.black, fontSize: 16)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Title & Category
            Row(
              children: [
                Expanded(
                  child: Text(
                    report.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.darkBlue), // Border only
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    report.category,
                    style: TextStyle(color: AppColors.darkBlue, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),            
            SizedBox(height: 4),
            Text("KNWT Charity Organisation", style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.w500)),
            Text("${report.createdAt.day} March ${report.createdAt.year}", style: TextStyle(fontSize: 12, color: Colors.grey[500], fontWeight: FontWeight.w500)),
            SizedBox(height: 8),

            SizedBox(height: 16),

            // Milestone Progress & Fund Release
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(report.milestones.length, (index) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: index <= currentMilestoneIndex ? AppColors.darkBlue : AppColors.grey,
                          ),
                          if (index < report.milestones.length - 1)
                            SizedBox(
                              width: 30,
                              child: Divider(
                                thickness: 2,
                                color: index < currentMilestoneIndex ? AppColors.darkBlue : AppColors.grey,
                              ),
                            ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Text(
                    report.milestones[currentMilestoneIndex].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "MYR ${report.raisedAmount.toStringAsFixed(0)}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.darkBlue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Description Section
            Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text(
              report.description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.justify,
            ),

            SizedBox(height: 16),

            // Financial Proof
            Text("Financial Proof", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProofCard("Transaction Receipt"),
                _buildProofCard("Transaction Receipt"),
              ],
            ),

            SizedBox(height: 16),

            // Photos & Videos
            Text("Photos & Videos", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                _buildImageCard(report.coverImage),
                _buildImageCard(report.coverImage),
                _buildImageCard(report.coverImage),
              ],
            ),

            SizedBox(height: 16),

            // Donation Progress & Button
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "MYR ${report.raisedAmount.toStringAsFixed(0)}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text("out of MYR ${report.targetAmount.toStringAsFixed(0)}",
                          style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                  SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: report.raisedAmount / report.targetAmount,
                      backgroundColor: Colors.grey[300],
                      color: AppColors.darkBlue,
                      minHeight: 8,
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: Text("Donate", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Financial Proof
  Widget _buildProofCard(String title) {
    return Container(
      width: 140,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long, size: 40, color: Colors.blue),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
        ],
      ),
    );
  }

  // Helper Widget for Image Card
  Widget _buildImageCard(String imageUrl) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(imageUrl, width: 100, height: 80, fit: BoxFit.cover),
      ),
    );
  }
}
