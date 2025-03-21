import 'package:fidefund/controllers/currency_controller.dart';
import 'package:fidefund/controllers/donor_controller.dart';
import 'package:fidefund/models/donation_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/utils/app_images.dart';
import 'package:fidefund/utils/blockchain_helper.dart';
import 'package:fidefund/widgets/circle_avatar.dart';
import 'package:fidefund/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class RecentDonationBubble extends StatelessWidget {
  final Donation donation;
  final Color backgroundColor;

  const RecentDonationBubble({
    Key? key,
    required this.donation,
    this.backgroundColor = AppColors.secondaryBlue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = CurrencyController.getCurrencyBySymbol(
      donation.currency.toUpperCase(),
    );
    final donorProfile = DonorController.getDonorImage(donation.donorId);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Donor Avatar, Name, and Description
              Row(
                children: [
                  CustomCircularAvatar(
                    radius: 15,
                    imagePath: donorProfile ?? AppImages.image_placeholder,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DonorController.getDonorUsername(donation.donorId),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          donation.note ?? "",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// Donation Amount with Currency Image
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "${donation.amount} ${donation.currency}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        currency?.icon ?? AppImages.image_placeholder,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                  Text(
                    "(~MYR ${donation.myrRate})",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    text: BlockchainHelper.generateShortenHash(),
                    color: AppColors.primaryBlue,
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),

          /// Timestamp and Action Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [],
          ),
        ],
      ),
    );
  }
}
