import 'package:fidefund/controllers/donation_controller.dart';
import 'package:fidefund/models/donation_model.dart';
import 'package:fidefund/models/donor_model.dart';
import 'package:fidefund/utils/app_images.dart';
import 'package:fidefund/utils/date_time_helper.dart';

class DonorController {
  static List<Donor> mockDonors = [
    Donor(
      id: "donor_1",
      username: "Firdaus",
      firstName: "Firdaus",
      lastName: "Johan",
      email: "johan@example.com",
      phone: "+60123456789",
      profileImage: AppImages.imageUserMM1,
      walletAddress: "0x1234567890",
      preferedCause: "Education",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_2",
      username: "Ahmad Zafran",
      firstName: "Zafran",
      lastName: "Ahmad",
      email: "ahmad@example.com",
      phone: "+60129876543",
      profileImage: AppImages.imageUserMM2,
      walletAddress: "0x0987654321",
      preferedCause: "Environment",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_3",
      username: "Nur Aisyah",
      firstName: "Nur Aisyah",
      lastName: "Sophia",
      email: "aisyah@example.com",
      phone: "+60122334455",
      profileImage: AppImages.imageUserMF1,
      walletAddress: "0x5678123456",
      preferedCause: "Health",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_4",
      username: "Amira",
      firstName: "Amira",
      lastName: "Aisyah",
      email: "amira@example.com",
      phone: "+60126789101",
      profileImage: AppImages.imageUserMF2,
      walletAddress: "0x1122334455",
      preferedCause: "HIV/AIDS Awareness",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_5",
      username: "Sanggari",
      firstName: "Sanggari",
      lastName: "",
      email: "sanggari@example.com",
      phone: "+60139876543",
      profileImage: AppImages.imageUserIF1,
      walletAddress: "0x5566778899",
      preferedCause: "Poverty Relief",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_6",
      username: "Kai Xuan",
      firstName: "Kai Xuan",
      lastName: "Tey",
      email: "kaixuan@example.com",
      phone: "+60131112223",
      profileImage: AppImages.imageUserCF2,
      walletAddress: "0x6677889900",
      preferedCause: "Children Welfare",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_7",
      username: "Lim Jia Ying",
      firstName: "Jia Ying",
      lastName: "Lim",
      email: "jia@example.com",
      phone: "+60134455667",
      profileImage: AppImages.imageUserCM2,
      walletAddress: "0x9988776655",
      preferedCause: "Orphan Care",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_8",
      username: "Zize",
      firstName: "Pua Teng Teng",
      lastName: "",
      email: "zize@example.com",
      phone: "+60137778899",
      profileImage: AppImages.imageUserCF1,
      walletAddress: "0x3344556677",
      preferedCause: "Food Security",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_9",
      username: "Karry",
      firstName: "Karry Wang Jun Kai",
      lastName: "",
      email: "karry@example.com",
      phone: "+60139990011",
      profileImage: AppImages.imageUserCM1,
      walletAddress: "0x2211334455",
      preferedCause: "Disaster Relief",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Donor(
      id: "donor_10",
      username: "Skeleton",
      firstName: "Kelly",
      lastName: "Tan",
      email: "skeleton@example.com",
      phone: "+60131235536",
      profileImage: AppImages.imageUserSkeleton,
      walletAddress: "0x9911334455",
      preferedCause: "Disaster Relief",
      createdAt: DateTimeHelper.randomPastDate(),
    ),
  ];

  static String getDonorUsername(String userId) {
    try {
      return mockDonors.firstWhere((donor) => donor.id == userId).username;
    } catch (e) {
      return "Username";
    }
  }

  static String? getDonorImage(String userId) {
    try {
      return mockDonors.firstWhere((donor) => donor.id == userId).profileImage;
    } catch (e) {
      return null;
    }
  }

  static List<Map<String, dynamic>> getDonorRank() {
    List<Donation> topDonations = DonationController.getDonationsSortedByMyr();
    Set<String> donorIds = {};
    List<Map<String, dynamic>> rankedDonors = topDonations
        .where((donation) => donorIds.add(donation.donorId)) // Ensures unique donors
        .map((donation) {
          return {
            'username': getDonorUsername(donation.donorId),
            'profileImage': getDonorImage(donation.donorId) ?? AppImages.imageUserSkeleton,
            'amount': donation.myrRate,
          };
        }).toList();

    return rankedDonors;
  }

}
