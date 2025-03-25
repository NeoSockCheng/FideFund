//charity home screen
import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/widgets/charity_campaign_card.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/screens/charity/charity_create_campaign.dart';

class CharityHomePage extends StatelessWidget {
  CharityHomePage({Key? key}) : super(key: key);
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
                    color: Colors.black.withOpacity(0.1), 
                    blurRadius: 10, 
                    spreadRadius: 2, 
                    offset: Offset(0, 4), 
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
                    "Hi Monztiez",
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
                      padding: EdgeInsets.only(top: 20, bottom: 5),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // "Start a Campaign" Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: GestureDetector(
                onTap: () {
                  // TODO: Add navigation or action
                  // Navigate to CharityCreateCampaignPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CharityCreateCampaignPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF41798E), 
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start a Campaign",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: List.generate(
                              8,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Color(0xFFE14D94),
                        size: 45,
                      ), 
                    ],
                  ),
                ),
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
                  return CharityCampaignCard(campaign: campaigns[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
