class Donation {
  final String id;
  final double amount;
  final String currency;
  final String donorId;
  final String charityId;
  final String txnHash;
  String? note;
  double myrRate;
  final DateTime createdAt;

  Donation({
    required this.id,
    required this.amount,
    required this.currency,
    required this.donorId,
    required this.charityId,
    required this.txnHash,
    this.note,
    required this.myrRate,
    required this.createdAt,
  });

}

