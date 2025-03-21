import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/utils/app_images.dart';
import 'package:fidefund/utils/date_time_helper.dart';

class CampaignController {

  static List<Campaign> mockCampaigns = [
    Campaign(
      id: "campaign_1",
      title: "Clean Water for Rural Communities",
      description:
          "We aim to provide clean and safe drinking water to rural villages in Malaysia by installing water filtration systems.",
      charityId: "charity_5",
      category: "Clean Water",
      targetAmount: 50000,
      raisedAmount: 38250,
      donorCount: 180,
      coverImage: AppImages.imageCampaignCleanWater,
      images: [],
      document: [],
      startDate: DateTimeHelper.randomPastDate(),
      endDate: DateTimeHelper.randomFutureDate(),
      isActive: true,
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Campaign(
      id: "campaign_2",
      title: "Nutritious Meals for Children",
      description:
          "Ensuring that underprivileged children receive nutritious meals to support their health and well-being.",
      charityId: "charity_4",
      category: "Food Aid",
      targetAmount: 30000,
      raisedAmount: 21500,
      donorCount: 300,
      coverImage: AppImages.imageCampaignFoodCharity,
      images: [],
      document: [],
      startDate: DateTimeHelper.randomPastDate(),
      endDate: DateTimeHelper.randomFutureDate(),
      isActive: true,
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Campaign(
      id: "campaign_3",
      title: "Education for Every Child",
      description:
          "Providing school supplies, books, and tuition assistance to children from low-income families.",
      charityId: "charity_3",
      category: "Education",
      targetAmount: 20000,
      raisedAmount: 15780,
      donorCount: 220,
      coverImage: AppImages.imageCampaignKidsEducation,
      images: [],
      document: [],
      startDate: DateTimeHelper.randomPastDate(),
      endDate: DateTimeHelper.randomFutureDate(),
      isActive: true,
      createdAt: DateTimeHelper.randomPastDate(),
    ),
  ];

  static String? getCampaignImage(String campaignId) {
    try {
      return mockCampaigns.firstWhere((campaign) => campaign.id == campaignId).coverImage;
    } catch (e) {
      return null;
    }
  }

  static String? getCampaignTitle(String campaignId) {
    try {
      return mockCampaigns.firstWhere((campaign) => campaign.id == campaignId).title;
    } catch (e) {
      return null;
    }
  }

  static String getCharityId(String campaignId) {
    try {
      return mockCampaigns.firstWhere((campaign) => campaign.id == campaignId).charityId;
    } catch (e) {
      return "Charity Id";
    }
  }

}