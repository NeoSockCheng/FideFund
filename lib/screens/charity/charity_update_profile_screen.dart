import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/controllers/charity_controller.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/models/charity_model.dart';
import 'package:fidefund/widgets/charity_campaign_card.dart';

class CharityUpdateProfilePage extends StatelessWidget {
  CharityUpdateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Charity charity = CharityController.getCharityById("charity_1");
    final Campaign campaign = CampaignController.getCampaignById("1");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          padding: const EdgeInsets.only(right: 10.0, left: 10),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Text(
            "Update Profile",
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Add edit functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Existing code remains the same...
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  charity.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),

              // Charity Image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    campaign.coverImage,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // About Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "About us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(charity.about),
              ),
              SizedBox(height: 20),

              // Reach Out Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Reach Out to Us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 10),
                    Text(charity.email),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.language),
                    SizedBox(width: 10),
                    Text(charity.website ?? "No website available"),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 10),
                    Text(charity.phone),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Top Contributor",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/charity_profile/contributor_${index + 1}.jpg",
                          ),
                          backgroundColor: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Active Campaigns",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              // Display the CampaignCard without extra padding
              CharityCampaignCard(campaign: campaign),
            ],
          ),
        ),
      ),
    );
  }
}