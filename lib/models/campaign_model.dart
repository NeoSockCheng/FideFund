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
  });

  
}
