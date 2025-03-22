import 'package:fidefund/models/charity_verification_model.dart';

class Charity {
  final String id;
  String name;
  int regNumber;
  String description;
  String email;
  String phone;
  String? website;
  String? logoImage;
  String? backgroundImage;
  List<String>? images;
  String? walletAddress;
  CharityVerification? verification;
  DateTime createdAt;

  Charity({
    required this.id,
    required this.name,
    required this.regNumber,
    required this.description,
    required this.email,
    required this.phone,
    this.website,
    this.logoImage,
    this.backgroundImage,
    this.images,
    this.walletAddress,
    this.verification,
    required this.createdAt,
  });

}
