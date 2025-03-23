import 'package:fidefund/models/milestone_model.dart';

class Campaign {
  final String id;
  String title;
  String description;
  String charityId;
  String category;
  double targetAmount;
  double raisedAmount;
  int donorCount;
  String coverImage;
  List<String> images;
  List<String> document;
  DateTime startDate;
  DateTime endDate;
  bool isActive;
  DateTime createdAt;
  String status;
  List<Milestone> milestones;

  Campaign({
    required this.id,
    required this.title,
    required this.description,
    required this.charityId,
    required this.category,
    required this.targetAmount,
    required this.raisedAmount,
    required this.donorCount,
    required this.coverImage,
    required this.images,
    required this.document,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.createdAt,
    required this.status,
    this.milestones = const [],
  });

  factory Campaign.empty() {
    return Campaign(
      id: "",
      title: "Unknown Campaign",
      description: "No details available",
      charityId: "",
      category: "Unknown",
      targetAmount: 0.0,
      raisedAmount: 0.0,
      donorCount: 0,
      coverImage: "assets/default_image.png", 
      images: [],
      document: [],
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      isActive: false,
      createdAt: DateTime.now(),
      milestones: [],
      status: "",
    );
  }
}
