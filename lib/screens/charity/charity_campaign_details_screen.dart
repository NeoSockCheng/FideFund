import 'package:fidefund/controllers/charity_controller.dart';
import 'package:fidefund/screens/donate/payment_screen.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/widgets/milestone_card.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/models/campaign_model.dart';

class CharityCampaignDetailsPage extends StatelessWidget {
  final Campaign campaign;

  const CharityCampaignDetailsPage({Key? key, required this.campaign})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    int remainingDays = campaign.endDate.difference(DateTime.now()).inDays;
    String charityName = CharityController.getCharityName(campaign.charityId);
    String? charityImage = CharityController.getCharityImage(
      campaign.charityId,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ), // Leave space for the button
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      campaign.coverImage,
                      width: double.infinity,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          campaign.category.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          campaign.title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              "${campaign.raisedAmount.toStringAsFixed(0)} BTC",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "raised of ${campaign.targetAmount.toStringAsFixed(0)} BTC",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "$remainingDays days left",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value:
                                campaign.raisedAmount / campaign.targetAmount,
                            minHeight: 8,
                            backgroundColor: AppColors.lightGrey,
                            color: AppColors.darkBlue,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  charityImage != null
                                      ? NetworkImage(charityImage)
                                      : const AssetImage(
                                            'assets/images/default_charity.png',
                                          )
                                          as ImageProvider,
                              radius: 20,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  charityName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Organizer",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "About",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          campaign.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildMilestonesSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestonesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Milestones",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        MilestoneCard(milestones: campaign.milestones),
      ],
    );
  }
}
