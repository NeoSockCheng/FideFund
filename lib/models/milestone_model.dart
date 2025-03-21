class Milestone {
  final String id;
  String title;
  String description;
  int order;
  int contributors;
  double targetAmount;
  double raisedAmount;
  bool isComplete;
  String coverImage;
  List<String>? image;
  List<String>? document;
  DateTime createdAt;

  Milestone({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
    required this.contributors,
    required this.targetAmount,
    required this.raisedAmount,
    required this.isComplete,
    required this.coverImage,
    this.image,
    this.document,
    required this.createdAt,
  });
}
