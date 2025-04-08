import 'package:fidefund/controllers/charity_controller.dart';
import 'package:fidefund/controllers/donor_controller.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/models/donation_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/utils/app_images.dart';
import 'package:fidefund/utils/blockchain_helper.dart';
import 'package:fidefund/widgets/circle_avatar.dart';
import 'package:fidefund/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class RealTimeAllDonationsItem extends StatelessWidget {
  final Donation donations;

  const RealTimeAllDonationsItem({super.key, required this.donations});

  @override
  Widget build(BuildContext context) {
    final donorImage =
        DonorController.getDonorImage(donations.donorId) ??
        AppImages.image_placeholder;
    final donorUsername = DonorController.getDonorUsername(donations.donorId);
    final charityName = CharityController.getCharityName(donations.charityId);
    final charityImage =
        CharityController.getCharityImage(donations.charityId) ??
        AppImages.image_placeholder;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCircularAvatar(radius: 20, imagePath: donorImage),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "$donorUsername ",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColors.white,
                            ),
                          ),
                          const TextSpan(
                            text: "donated ",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal, 
                              color: AppColors.secondaryBlue,
                            ),
                          ),
                          TextSpan(
                            text: "${donations.amount} ",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: "${donations.currency.toUpperCase()} ",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const TextSpan(
                            text: "to ",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColors.secondaryBlue
                            ),
                          ),
                          TextSpan(
                            text: "$charityName",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "${donations.createdAt.year}/${donations.createdAt.month.toString().padLeft(2, '0')}/${donations.createdAt.day.toString().padLeft(2, '0')} ${donations.createdAt.hour.toString().padLeft(2, '0')}:${donations.createdAt.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.secondaryBlue,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Spacer(),
                        CustomTextButton(
                          text: BlockchainHelper.generateShortenHash(),
                          color: AppColors.secondaryBlue,
                          fontSize: 10.0,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              CustomCircularAvatar(radius: 20, imagePath: charityImage),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Divider(color: Colors.white, thickness: 1),
          ),
        ],
      ),
    );
  }
}