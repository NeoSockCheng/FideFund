import 'package:fidefund/models/donation_model.dart';
import 'package:fidefund/screens/real_time/real_time_bottom.dart/real_time_bubble_transactions.dart';
import 'package:fidefund/screens/real_time/real_time_bottom.dart/real_time_milestone_card.dart';
import 'package:fidefund/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/theme/typography.dart';

class RealTimeBottomView extends StatelessWidget {
  final List<Donation> donations;

  const RealTimeBottomView({super.key, required this.donations});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Donations",
                    style: AppTypography.textStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  CustomTextButton(
                    text: "View All >",
                    onPressed: () {
                      // Navigate to full donatinon list page
                    },
                    color: AppColors.darkBlue,
                  ),
                ],
              ),
            ),

            DonationBubbleList(),

            SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Payment Released",
                    style: AppTypography.textStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  CustomTextButton(
                    text: "View All >",
                    onPressed: () {},
                    color: AppColors.darkBlue,
                  ),
                ],
              ),
            ),

            RealTimeMilestoneCard(),
          ],
        ),
      ),
    );
  }
}
