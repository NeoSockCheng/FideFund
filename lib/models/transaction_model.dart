  class Transaction {
  final String hash;
  final String campaignTitle;
  final String senderAddress;
  final String receiverAddress;
  final double amount;
  final String currency;
  String? note;
  double status;
  final DateTime createdAt;

  Transaction({
    required this.hash,
    required this.campaignTitle,
    required this.senderAddress,
    required this.receiverAddress,
    required this.amount,
    required this.currency,
    this.note,
    required this.status,
    required this.createdAt,
  });
}
