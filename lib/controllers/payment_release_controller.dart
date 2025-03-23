import 'package:fidefund/models/payment_release_model.dart';
import 'package:fidefund/utils/app_images.dart';

class PaymentReleaseController {
  final List<PaymentRelease> mockPaymentReleases = [
    PaymentRelease(
      hash: "0xPR1234AB",
      campaignTitle: "Education Fund",
      campaignImage: AppImages.imageCampaignKidsEducation,
      amountMYR: 5000.0,
      note: "Funds released for scholarship disbursement.",
      status: 1.0,
      createdAt: DateTime(2025, 3, 15),
    ),
    PaymentRelease(
      hash: "0xPR5678CD",
      campaignTitle: "Community Support",
      campaignImage: AppImages.imageCharityGlobalAid,
      amountMYR: 2500.0,
      note: "Relief fund for local community center.",
      status: 1.0,
      createdAt: DateTime(2025, 3, 14),
    ),
    PaymentRelease(
      hash: "0xPR9ABC34",
      campaignTitle: "Healthcare Relief",
      campaignImage: AppImages.imageMilestoneMedical,
      amountMYR: 7000.0,
      note: "Hospital aid for underprivileged patients.",
      status: 1.0,
      createdAt: DateTime(2025, 3, 13),
    ),
    PaymentRelease(
      hash: "0xPRD4E5F6",
      campaignTitle: "Disaster Relief",
      campaignImage: AppImages.imageMilestoneFlood,
      amountMYR: 10000.0,
      note: "Emergency response for flood victims.",
      status: 1.0,
      createdAt: DateTime(2025, 3, 12),
    ),
    PaymentRelease(
      hash: "0xPRG7H8I9",
      campaignTitle: "Animal Rescue",
      campaignImage: AppImages.imageMilestoneStraydogs,
      amountMYR: 3500.0,
      note: "Veterinary assistance for rescued animals.",
      status: 1.0,
      createdAt: DateTime(2025, 3, 11),
    ),
  ];
}