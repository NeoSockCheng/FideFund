import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/widgets/campaign_card.dart';
import 'package:fidefund/widgets/search_bar.dart'; 
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DonatePage extends StatelessWidget {
  DonatePage({Key? key}) : super(key: key);
  List<Campaign> campaigns = CampaignController.mockCampaigns;

  // final List<Organization> organizations = [
  //   Organization(
  //     id: "KNWT",
  //     name: "NKVE",
  //     description:
  //         "We are raising funds to purchase monitors, keyboards, and other essential electronic gadgets to enhance our work and productivity. These devices will help us improve efficiency, communication, and more.",
  //     ownerId: "user123",
  //     category: "Technology",
  //     contributors: 120,
  //     fundsRaised: 34567.89,
  //     goalAmount: 40000,
  //     image: AppImages.imageNkve,
  //   ),
  //   Organization(
  //     id: "KNWT",
  //     name: "NKVE",
  //     description: "Providing free education to underprivileged children.",
  //     ownerId: "user456",
  //     category: "Education",
  //     contributors: 250,
  //     fundsRaised: 8000,
  //     goalAmount: 12000,
  //     image: AppImages.imageNkve,
  //   ),
  //   Organization(
  //     id: "KNWT",
  //     name: "NKVE",
  //     description:
  //         "We are raising funds to purchase monitors, keyboards, and other essential electronic gadgets to enhance our work and productivity. These devices will help us improve efficiency, communication, and more.",
  //     ownerId: "user123",
  //     category: "Technology",
  //     contributors: 120,
  //     fundsRaised: 34567.89,
  //     goalAmount: 40000,
  //     image: AppImages.imageNkve,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ✅ Ensures content stays within view
        child: Column(
          children: [
            SearchBarWidget(
              controller: TextEditingController(),
              onFilterPressed: () {},
              onChanged: (value) {},
            ),
            Expanded(
              // ✅ Now it can take up remaining space
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
