import 'package:fidefund/models/milestone_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';

class MilestoneCard extends StatelessWidget {
  final List<Milestone> milestones;

  const MilestoneCard({Key? key, required this.milestones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: milestones.asMap().entries.map((entry) {
        final int index = entry.key;
        final Milestone milestone = entry.value;
        final bool isLast = index == milestones.length - 1;

        return Stack(
          children: [
            if (!isLast)
              // line for milestone
              Positioned(
                left: 27,
                top: 12,
                bottom: 0,
                child: Container(
                  width: 2,
                  height: 100,
                  color: AppColors.grey,
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
              child: Row(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
