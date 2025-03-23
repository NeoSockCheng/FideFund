class PaymentRelease {
  final String hash;
  final String campaignTitle;
  final String campaignImage;
  final double amountMYR;
  String? note;
  double status;
  final DateTime createdAt;

  PaymentRelease({
    required this.hash,
    required this.campaignTitle,
    required this.campaignImage,
    required this.amountMYR,
    this.note,
    required this.status,
    required this.createdAt,
  });
}
