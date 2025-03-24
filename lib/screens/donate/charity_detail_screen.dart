import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/controllers/charity_controller.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/models/charity_model.dart';
import 'package:fidefund/widgets/campaign_card.dart';

class CharityDetailPage extends StatelessWidget {
  CharityDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // xxcontroller.method(parameter)
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
            "Charity Details",
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 20, // Adjust text size
              fontWeight: FontWeight.bold, // Adjust font weight
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Charity Name
            Text(
              charity.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Charity Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                campaign.coverImage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // About Section
            Text(
              "About us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(charity.about),
            SizedBox(height: 20),

            // Reach Out Section
            Text(
              "Reach Out to Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Text(charity.email),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.language),
                SizedBox(width: 10),
                Text(charity.website ?? "No website available"),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text(charity.phone),
              ],
            ),
            SizedBox(height: 20),

            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Aligns title to the left
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    //left: 8.0,
                    bottom: 8.0,
                  ), // Adjust spacing
                  child: Text(
                    "Top Contributor",
                    style: TextStyle(
                      fontSize: 18, // Adjust size
                      fontWeight: FontWeight.bold,
                      color: AppColors.black, // Adjust color if needed
                    ),
                  ),
                ),
                Center(
                  // Centers the row of avatars
                  child: Row(
                    mainAxisSize:
                        MainAxisSize
                            .min, // Ensures it takes only necessary space
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          top: 10,
                          bottom: 20,
                        ),
                        child: CircleAvatar(
                          radius: 28, // Adjust size
                          backgroundImage: AssetImage(
                            "assets/images/charity_profile/contributor_${index + 1}.jpg",
                          ),
                          backgroundColor:
                              AppColors.grey, // Fallback color if no image
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Display the CampaignCard for a single campaign
            CampaignCard(campaign: campaign),
          ],
        ),
      ),
    );
  }
}
