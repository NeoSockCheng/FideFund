import 'package:fidefund/models/organization_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Organization organization;

  const ProjectCard({Key? key, required this.organization}) : super(key: key);

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
                      "Donate for ${organization.name}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // ID and Category in one row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            "${organization.id}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Chip(
                          label: Text(
                            organization.category,
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

                    const SizedBox(height: 8),
                    Text(
                      organization.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      "MYR ${organization.fundsRaised.toStringAsFixed(2)}",
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
                            text: "${organization.contributors}", // Contributors (Bold)
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
                        value: organization.progress,
                        minHeight: 8,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          organization.progress >= 1.0
                              ? AppColors.primaryBlue
                              : AppColors.secondaryBlue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      "Goal: MYR ${organization.goalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
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
                organization.image,
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
