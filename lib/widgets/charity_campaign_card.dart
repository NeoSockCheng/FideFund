import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';

class CharityCampaignCard extends StatelessWidget {
  final Campaign campaign;

  const CharityCampaignCard({Key? key, required this.campaign})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Card(
        color: AppColors.white,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Side: Organization Info with Padding
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Donate for ${campaign.title}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Status and Category in one row**********
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: const EdgeInsets.only(top: 4)),
                        Chip(
                          label: Text(
                            campaign.status,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.green,
                            ),
                          ),
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: AppColors.green),
                          ),
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 0,
                          ),
                        ),
                        const Spacer(),
                        Chip(
                          label: Text(
                            campaign.category,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.darkBlue,
                            ),
                          ),
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: Colors.blue),
                          ),
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 0,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Text(
                      "MYR ${campaign.raisedAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),

                    Text.rich(
                      TextSpan(
                        text: "Raised from ", // Normal text
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grey,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "${campaign.donorCount}", // Contributors (Bold)
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, // Make it bold
                              color: AppColors.grey, // Keep the same color
                            ),
                          ),
                          TextSpan(
                            text: " contributors", // Normal text
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 6),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: campaign.raisedAmount / campaign.targetAmount,
                        minHeight: 8,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          (campaign.raisedAmount / campaign.targetAmount) >= 1.0
                              ? AppColors.primaryBlue
                              : AppColors.secondaryBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      "Goal: MYR ${campaign.targetAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        // View Button
                        OutlinedButton.icon(
                          onPressed: () {
                            // Handle View action
                          },
                          icon: Image.asset(
                            'assets/icons/icon_view.png',
                            width: 35,
                            height: 35,
                          ),
                          label: const Text(
                            "View",
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.darkBlue,
                            ), // Border color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              // vertical: 10,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        //impact report button
                        OutlinedButton.icon(
                          onPressed: () {
                            // Handle impact report action
                          },
                          icon: Image.asset(
                            'assets/icons/icon_impact_report.png',
                            width: 35,
                            height: 35,
                          ),
                          label: const Text(
                            "Create Impact Report",
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppColors.darkBlue,
                            ), // Border color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              // vertical: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Right Side: Organization Image (Full Height & Width of Card)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                campaign.coverImage,
                width: 100,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 140,
                    height: 250,
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: const Icon(Icons.image_not_supported, size: 40),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
