import 'package:fidefund/models/milestone_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';

class MilestoneCard extends StatelessWidget {
  final List<Milestone> milestones;

  const MilestoneCard({Key? key, required this.milestones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: milestones.map((milestone) {
        int index = milestones.indexOf(milestone);
        bool isLast = index == milestones.length - 1;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: milestone.isComplete ? AppColors.darkBlue : AppColors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast) ...[
                  Container(
                    width: 2,
                    height: 50,
                    color: AppColors.grey,
                  ),
                ]
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Milestone ${milestone.order}: ${milestone.title}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    milestone.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}