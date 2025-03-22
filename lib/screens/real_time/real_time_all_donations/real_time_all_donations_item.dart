import 'package:fidefund/controllers/charity_controller.dart';
import 'package:fidefund/controllers/donor_controller.dart';
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
            children: [
              CustomCircularAvatar(radius: 20, imagePath: donorImage),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "$donorUsername ",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const TextSpan(
                            text: "donated ",
                            style: const TextStyle(fontWeight: FontWeight.w100),
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
                            style: const TextStyle(fontWeight: FontWeight.w200),
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
                          "${donations.createdAt}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w200,
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
              const SizedBox(width: 30),
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
