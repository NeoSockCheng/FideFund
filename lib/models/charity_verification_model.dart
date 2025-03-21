class CharityVerification {
  final String regCertificate;
  final String? representativeId; 
  final String? proofOfAuthorization; 
  bool? isVerified;
  final DateTime verifiedAt;

  CharityVerification({
    required this.regCertificate,
    this.representativeId,
    this.proofOfAuthorization,
    this.isVerified,
    required this.verifiedAt,
  });
}