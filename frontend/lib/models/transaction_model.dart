  class Transaction {
  final String hash;
  final String campaignTitle;
  final String senderAddress;
  final String receiverAddress;
  final double amountMYR;
  double? amountCrypto;
  String? Cryptocurrency;
  String? note;
  double status;
  final DateTime createdAt;

  Transaction({
    required this.hash,
    required this.campaignTitle,
    required this.senderAddress,
    required this.receiverAddress,
    required this.amountMYR,
    this.amountCrypto,
    this.Cryptocurrency,
    this.note,
    required this.status,
    required this.createdAt,
  });
}
