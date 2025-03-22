import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/widgets/campaign_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<Campaign> campaigns = CampaignController.mockCampaigns;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Light shadow
                    blurRadius: 10, // Soft blur effect
                    spreadRadius: 2, // Slightly spread the shadow
                    offset: Offset(0, 4), // Moves the shadow down
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FideFund",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Hi John",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Your contributions are making history!",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: InkWell(
                        onTap: () {
                          // TODO: Navigate to transaction page
                          //Navigator.pushNamed(context, '/transactions');
                        },
                        child: Text(
                          "Your transaction >",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Make an Impact Today",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.darkBlue,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            // Campaign List
            Expanded(
              child: ListView.builder(
                itemCount: campaigns.length,
                itemBuilder: (context, index) {
                  return CampaignCard(campaign: campaigns[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
