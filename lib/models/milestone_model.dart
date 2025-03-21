import 'package:fidefund/utils/app_images.dart';

class Milestone {
  final String projectImage;
  final String title;
  final String charityName;
  final double payment;
  final String hashValue;

  Milestone({
    required this.projectImage,
    required this.title,
    required this.charityName,
    required this.payment,
    required this.hashValue,
  });
}

final List<Milestone> mockMilestones = [
  Milestone(
    projectImage: AppImages.imageCleanWater,
    title: 'Clean Water Initiative',
    charityName: 'Water for All',
    payment: 500.00,
    hashValue: '0xc123...2fg4h2',
  ),
  Milestone(
    projectImage: AppImages.imageKidsEducation,
    title: 'Education Fund',
    charityName: 'Hope for Kids',
    payment: 750.00,
    hashValue: '0ef456...djfma2',
  ),
  Milestone(
    projectImage: AppImages.imageFoodCharity,
    title: 'Food Drive',
    charityName: 'Feeding Hands',
    payment: 300.00,
    hashValue: 'edfhas...21ifds',
  ),
];
