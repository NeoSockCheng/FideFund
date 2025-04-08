import 'package:fidefund/controllers/milestone_controller.dart';
import 'package:fidefund/models/campaign_model.dart';
import 'package:fidefund/utils/app_images.dart';

class CampaignController {
  static List<Campaign> mockCampaigns = [
    Campaign(
      id: "1",
      title: "Saving Stray Dogs in Melaka",
      description: "A campaign to save stray dogs...",
      charityId: "charity_1",
      category: "Animal Welfare",
      targetAmount: 10000,
      raisedAmount: 5000,
      donorCount: 120,
      coverImage: AppImages.imageMilestoneStraydogs,
      images: [],
      document: [],
      startDate: DateTime(2025, 3, 1),
      endDate: DateTime(2025, 4, 1),
      isActive: true,
      createdAt: DateTime(2025, 3, 14),
      status: "Active",
      milestones: MilestoneController.milestonesDogs,
    ),
    Campaign(
      id: "2",
      title: "E-Gadgets for B40 Students",
      description: "Providing gadgets for underprivileged students...",
      charityId: "charity_2",
      category: "Education",
      targetAmount: 15000,
      raisedAmount: 8000,
      donorCount: 200,
      coverImage: AppImages.imageMilestoneGadgets,
      images: [],
      document: [],
      startDate: DateTime(2025, 3, 5),
      endDate: DateTime(2025, 4, 5),
      isActive: true,
      createdAt: DateTime(2025, 3, 10),
      status: "Active",
      milestones: MilestoneController.milestonesGadgets,
    ),
    Campaign(
      id: "3",
      title: "Flood in East Coast Malaysia",
      description: "Flood relief for affected families...",
      charityId: "charity_3",
      category: "Disaster Relief",
      targetAmount: 20000,
      raisedAmount: 12000,
      donorCount: 300,
      coverImage: AppImages.imageMilestoneFlood,
      images: [],
      document: [],
      startDate: DateTime(2025, 2, 1),
      endDate: DateTime(2025, 3, 1),
      isActive: true,
      createdAt: DateTime(2025, 2, 7),
      status: "Active",
      milestones: MilestoneController.milestonesFlood,
    ),
    Campaign(
      id: "4",
      title: "Tree Planting Initiative",
      description: "Planting trees to combat deforestation...",
      charityId: "charity_4",
      category: "Environment",
      targetAmount: 12000,
      raisedAmount: 6000,
      donorCount: 150,
      coverImage: AppImages.imageMilestoneTrees,
      images: [],
      document: [],
      startDate: DateTime(2025, 1, 15),
      endDate: DateTime(2025, 2, 15),
      isActive: true,
      createdAt: DateTime(2025, 1, 25),
      status: "Active",
      milestones: MilestoneController.milestoneTree,
    ),
    Campaign(
      id: "5",
      title: "Orphanage Education Support",
      description: "Providing learning materials for orphanages...",
      charityId: "charity_5",
      category: "Children",
      targetAmount: 13000,
      raisedAmount: 7000,
      donorCount: 180,
      coverImage: AppImages.imageMilestoneOrphanage,
      images: [],
      document: [],
      startDate: DateTime(2025, 3, 1),
      endDate: DateTime(2025, 4, 1),
      isActive: true,
      createdAt: DateTime(2025, 3, 5),
      status: "Active",
      milestones: MilestoneController.milestonesOrphans,
    ),
    Campaign(
      id: "6",
      title: "Medical Aid for Rural Areas",
      description: "Supplying essential medicine to remote villages...",
      charityId: "charity_1",
      category: "Health",
      targetAmount: 15000,
      raisedAmount: 9500,
      donorCount: 220,
      coverImage: AppImages.imageMilestoneMedical,
      images: [],
      document: [],
      startDate: DateTime(2025, 2, 10),
      endDate: DateTime(2025, 3, 10),
      isActive: true,
      createdAt: DateTime(2025, 2, 28),
      status: "Active",
      milestones: MilestoneController.milestonesMedical,
    ),
    Campaign(
      id: "7",
      title: "Clean Water for Villages",
      description: "Building wells to provide clean drinking water...",
      charityId: "charity_2",
      category: "Water & Sanitation",
      targetAmount: 18000,
      raisedAmount: 11000,
      donorCount: 250,
      coverImage: AppImages.imageMilestoneWater,
      images: [],
      document: [],
      startDate: DateTime(2025, 2, 10),
      endDate: DateTime(2025, 3, 10),
      isActive: true,
      createdAt: DateTime(2025, 2, 15),
      status: "Active",
      milestones: MilestoneController.milestonesCleanWater,
    ),
    Campaign(
      id: "8",
      title: "Feeding the Homeless",
      description: "Providing meals and shelter for the homeless...",
      charityId: "charity_3",
      category: "Social Welfare",
      targetAmount: 20000,
      raisedAmount: 13000,
      donorCount: 280,
      coverImage: AppImages.imageMilestoneHomeless,
      images: [],
      document: [],
      startDate: DateTime(2025, 1, 20),
      endDate: DateTime(2025, 2, 20),
      isActive: true,
      createdAt: DateTime(2025, 1, 30),
      status: "Active",
      milestones: MilestoneController.milestonesHomeless,
    ),
    Campaign(
      id: "9",
      title: "Scholarships for Underprivileged Students",
      description: "Offering scholarships to talented students in need...",
      charityId: "charity_4",
      category: "Education",
      targetAmount: 25000,
      raisedAmount: 0,
      donorCount: 0,
      coverImage: AppImages.imageMilestoneScholarship,
      images: [],
      document: [],
      startDate: DateTime(2025, 1, 5),
      endDate: DateTime(2025, 3, 5),
      isActive: false,
      createdAt: DateTime(2025, 1, 20),
      status: "Pending",
      milestones: MilestoneController.milestonesScholarship,
    ),
    Campaign(
      id: "10",
      title: "Rebuilding Homes After Fire",
      description: "Helping families rebuild after a devastating fire...",
      charityId: "charity_5",
      category: "Disaster Relief",
      targetAmount: 30000,
      raisedAmount: 30000,
      donorCount: 350,
      coverImage: AppImages.imageMilestoneRebuild,
      images: [],
      document: [],
      startDate: DateTime(2025, 3, 1),
      endDate: DateTime(2025, 4, 1),
      isActive: false,
      createdAt: DateTime(2025, 3, 2),
      status: "Completed",
      milestones: MilestoneController.milestonesRebuild,
    ),
  ];

  static String? getCampaignImage(String campaignId) {
    try {
      return mockCampaigns
          .firstWhere((campaign) => campaign.id == campaignId)
          .coverImage;
    } catch (e) {
      return null;
    }
  }

  static String? getCampaignTitle(String campaignId) {
    try {
      return mockCampaigns
          .firstWhere((campaign) => campaign.id == campaignId)
          .title;
    } catch (e) {
      return null;
    }
  }

  static String getCharityId(String campaignId) {
    try {
      return mockCampaigns
          .firstWhere((campaign) => campaign.id == campaignId)
          .charityId;
    } catch (e) {
      return "Charity Id";
    }
  }

  static Campaign getCampaignById(String campaignId) {
    try {
      return mockCampaigns.firstWhere((campaign) => campaign.id == campaignId);
    } catch (e) {
      throw Exception('Charity with ID $campaignId not found.');
    }
  }
}
