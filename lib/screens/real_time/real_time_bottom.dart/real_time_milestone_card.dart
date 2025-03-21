import 'package:fidefund/controllers/campaign_controller.dart';
import 'package:fidefund/controllers/charity_controller.dart';
import 'package:fidefund/controllers/milestone_controller.dart';
import 'package:fidefund/models/milestone_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/utils/blockchain_helper.dart';
import 'package:fidefund/utils/date_time_helper.dart';
import 'package:fidefund/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class RealTimeMilestoneCard extends StatelessWidget {
  const RealTimeMilestoneCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Milestone> milestones = MilestoneController.mockMilestone.sublist(0, 3);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < milestones.length; i++) ...[
            _buildMilestoneItem(milestones[i], context),
            if (i != milestones.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
          ],
          const SizedBox(height: 8),
        ],
      ),
    );
  }

Widget _buildMilestoneItem(Milestone milestone, BuildContext context) {

  double screenWidth = MediaQuery.of(context).size.width;
  double horizontalPadding = 16 * 2; 
  double cardPadding = 12 * 2; 
  double imageWidth = 40; 
  double imageMargin = 8; 
  double hashButtonWidth = 70; 
  
  double textWidth = screenWidth - horizontalPadding - cardPadding - imageWidth - imageMargin - hashButtonWidth;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage(milestone.coverImage),
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          
          // Text content with constrained width
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MYR ${milestone.targetAmount.toStringAsFixed(2)} is released to ${CharityController.getCharityName(CampaignController.getCharityId(milestone.campaignId))}!',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 2),
                Text(
                  'Project "${milestone.name}" is completed, let\'s get excited for what’s coming next!',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 4),

      // Hash Button and timestamp
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            DateTimeHelper.formatDateYearMonthDay(milestone.createdAt),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          CustomTextButton(
            onPressed: () {},
            text: BlockchainHelper.generateShortenHash(),
            color: AppColors.primaryBlue,
          ),
        ],
      ),
    ],
  );
}

}
