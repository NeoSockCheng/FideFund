class Donor {
  final String id;
  String username;
  String firstName;
  String? lastName;
  String email;
  String? phone;
  String? profileImage;
  String? walletAddress; 
  String? preferedCause; 
  DateTime createdAt;

  Donor({
    required this.id,
    required this.username,
    required this.firstName,
    this.lastName,
    required this.email,
    this.phone,
    this.profileImage,
    this.walletAddress,
    this.preferedCause,
    required this.createdAt,
  });
  
}
