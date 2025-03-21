import 'package:fidefund/models/charity_model.dart';
import 'package:fidefund/models/charity_verification_model.dart';
import 'package:fidefund/utils/app_images.dart';
import 'package:fidefund/utils/date_time_helper.dart';

class CharityController {
  // incomplete one, can remove and design your own if required
  static List<Charity> mockCharity = [
    Charity(
      id: "charity_1",
      name: "National Cancer Society Malaysia (NCSM)",
      regNumber: 132143432432,
      description:
          "Providing holistic cancer support to patients and caregivers.",
      email: "contact@ncsm.org.my",
      phone: "+60326987300",
      website: "https://www.cancer.org.my",
      logoImage: AppImages.imageCharityNKVE,
      walletAddress: "0xABCDEF1234567890",
      verification: CharityVerification(
        regCertificate: "cert_001",
        representativeId: "rep_001",
        proofOfAuthorization: "proof_001",
        isVerified: true,
        verifiedAt: DateTimeHelper.randomPastDate(),
      ),
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Charity(
      id: "charity_2",
      name: "Hope Foundation for Children",
      regNumber: 987654321012,
      description:
          "Providing education and healthcare support to underprivileged children.",
      email: "info@hopefoundation.org",
      phone: "+60388776655",
      website: "https://www.hopefoundation.org",
      logoImage: AppImages.imageCharityKids,
      walletAddress: "0x1234ABCD5678EFGH",
      verification: CharityVerification(
        regCertificate: "cert_002",
        representativeId: "rep_002",
        proofOfAuthorization: "proof_002",
        isVerified: true,
        verifiedAt: DateTimeHelper.randomPastDate(),
      ),
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Charity(
      id: "charity_3",
      name: "Green Earth Conservation Society",
      regNumber: 564738291034,
      description:
          "Dedicated to protecting the environment and promoting sustainability.",
      email: "support@greenearth.org",
      phone: "+60355667788",
      website: "https://www.greenearth.org",
      logoImage: AppImages.imageCharityGreenEarth,
      walletAddress: "0x9876ZYXW4321VUTS",
      verification: CharityVerification(
        regCertificate: "cert_003",
        representativeId: "rep_003",
        proofOfAuthorization: "proof_003",
        isVerified: true,
        verifiedAt: DateTimeHelper.randomPastDate(),
      ),
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Charity(
      id: "charity_4",
      name: "Global Aid Network",
      regNumber: 246810121416,
      description:
          "Providing humanitarian aid, disaster relief, and community support worldwide.",
      email: "contact@globalaid.org",
      phone: "+60366778899",
      website: "https://www.globalaid.org",
      logoImage: AppImages.imageCharityGlobalAid,
      walletAddress: "0xA1B2C3D4E5F67890",
      verification: CharityVerification(
        regCertificate: "cert_004",
        representativeId: "rep_004",
        proofOfAuthorization: "proof_004",
        isVerified: true,
        verifiedAt: DateTimeHelper.randomPastDate(),
      ),
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Charity(
      id: "charity_5",
      name: "Malaysia Relief Alliance",
      regNumber: 102938475610,
      description:
          "Aiding communities affected by poverty, disasters, and economic hardship.",
      email: "help@myrelief.org",
      phone: "+60399887766",
      website: "https://www.myrelief.org",
      logoImage: AppImages.imageCharityNKVE,
      walletAddress: "0xCDEFA123456789AB",
      verification: CharityVerification(
        regCertificate: "cert_005",
        representativeId: "rep_005",
        proofOfAuthorization: "proof_005",
        isVerified: true,
        verifiedAt: DateTimeHelper.randomPastDate(),
      ),
      createdAt: DateTimeHelper.randomPastDate(),
    ),
    Charity(
      id: "charity_6",
      name: "Malaysia Animal Welfare Society",
      regNumber: 567890123456,
      description:
          "Rescuing, rehabilitating, and rehoming stray and abandoned animals in Malaysia.",
      email: "info@myanimalwelfare.org",
      phone: "+60377889911",
      website: "https://www.myanimalwelfare.org",
      logoImage: AppImages.imageCharityDogs,
      walletAddress: "0xFEDCBA9876543210",
      verification: CharityVerification(
        regCertificate: "cert_006",
        representativeId: "rep_006",
        proofOfAuthorization: "proof_006",
        isVerified: true,
        verifiedAt: DateTimeHelper.randomPastDate(),
      ),
      createdAt: DateTimeHelper.randomPastDate(),
    ),
  ];

  static String getCharityName(String charityId) {
    try {
      return mockCharity
          .firstWhere((campaign) => campaign.id == charityId)
          .name;
    } catch (e) {
      return "Charity Name";
    }
  }
}
