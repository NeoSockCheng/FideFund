import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/widgets/campaign_card.dart';
import 'package:fidefund/widgets/search_bar.dart'; 
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DonatePage extends StatelessWidget {
  DonatePage({Key? key}) : super(key: key);
  List<Campaign> campaigns = CampaignController.mockCampaigns;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBarWidget(
              controller: TextEditingController(),
              onFilterPressed: () {},
              onChanged: (value) {},
            ),
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
