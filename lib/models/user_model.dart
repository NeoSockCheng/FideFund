class User {
  final String id;
  final String name;
  final String email;
  final String walletAddress; // Blockchain wallet
  final double balance;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.walletAddress,
    required this.balance,
  });
}
