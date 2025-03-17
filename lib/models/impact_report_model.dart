class ImpactReport {
  final String id;
  final String name;
  final String description;
  final String ownerId;
  final String category;
  final int contributors;
  final double fundsRaised;
  final double goalAmount;
  final String image;
  final DateTime date;

  ImpactReport({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerId,
    required this.category,
    required this.contributors,
    required this.fundsRaised,
    required this.goalAmount,
    required this.image,
    required this.date,
  });
}