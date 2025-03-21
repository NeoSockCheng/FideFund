import 'package:fidefund/utils/app_images.dart';
import 'package:fidefund/utils/blockchain_helper.dart';

class Transaction {
  final String hash;
  final String transactionId;
  final String donorId;
  final String charityId;
  final double transactionValue;
  final String cryptoUsed;
  final double valueInMyr;
  final DateTime timestamp;
  final String description;
  final String userPhoto;

  Transaction({
    required this.hash,
    required this.transactionId,
    required this.donorId,
    required this.charityId,
    required this.transactionValue,
    required this.cryptoUsed,
    required this.valueInMyr,
    required this.timestamp,
    required this.description,
    required this.userPhoto,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      hash: json['hash'],
      transactionId: json['transaction_id'],
      donorId: json['donor_id'],
      charityId: json['charity_id'],
      transactionValue: (json['transaction_value'] as num).toDouble(),
      cryptoUsed: json['crypto_used'],
      valueInMyr: (json['value_in_myr'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
      description: json['description'],
      userPhoto: json['user_photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'transaction_id': transactionId,
      'donor_id': donorId,
      'charity_id': charityId,
      'transaction_value': transactionValue,
      'crypto_used': cryptoUsed,
      'value_in_myr': valueInMyr,
      'timestamp': timestamp.toIso8601String(),
      'description': description,
      'user_photo': userPhoto,
    };
  }
}

// Mock Data
List<Transaction> mockTransactions = [
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: '1',
    donorId: 'Johan Firdaus',
    charityId: 'National Cancer Society Malaysia (NCSM)',
    transactionValue: 0.05,
    cryptoUsed: 'BTC',
    valueInMyr: 1500.00,
    timestamp: DateTime.now().subtract(Duration(minutes: 10)),
    description: 'Wishing all cancer patients strength and courage in their journey. May this donation help bring hope and healing',
    userPhoto: AppImages.imageUserMM1,
  ),
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: 'tx124',
    donorId: 'Ahmad Zafran',
    charityId: 'Community Recycle for Charity (CRC)',
    transactionValue: 0.10,
    cryptoUsed: 'ETH',
    valueInMyr: 3000.00,
    timestamp: DateTime.now().subtract(Duration(hours: 1)),
    description: 'Every small act counts! Let\'s recycle and give back to those in need. Together, we can create a cleaner and kinder world.',
    userPhoto: AppImages.imageUserMM2,
  ),
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: 'tx125',
    donorId: 'Nur Aisyah',
    charityId: 'Buddhist Tzu Chi Merit Society Malaysia',
    transactionValue: 0.20,
    cryptoUsed: 'USDC',
    valueInMyr: 6000.00,
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    description: 'May this contribution bring relief and comfort to those facing hardships. A little kindness goes a long way.',
    userPhoto: AppImages.imageUserMF1,
  ),
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: 'tx123',
    donorId: 'Amira',
    charityId: 'PT Foundation',
    transactionValue: 0.01,
    cryptoUsed: 'BTC',
    valueInMyr: 3000.00,
    timestamp: DateTime.now().subtract(Duration(minutes: 10)),
    description: 'Everyone deserves love, care, and support. Hoping this donation helps those affected by HIV/AIDS find strength and a brighter future.',
    userPhoto: AppImages.imageUserMF2,
  ),
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: 'tx124',
    donorId: 'Sanggari',
    charityId: 'HATI',
    transactionValue: 0.08,
    cryptoUsed: 'ETH',
    valueInMyr: 1400.00,
    timestamp: DateTime.now().subtract(Duration(hours: 1)),
    description: 'Education, food, and shelter should be accessible to all. May this small gesture bring hope to those who need it most.',
    userPhoto: AppImages.imageUserIF1,
  ),
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: 'tx125',
    donorId: 'Kai Xuan',
    charityId: 'Yayasan Chow Kit',
    transactionValue: 15.20,
    cryptoUsed: 'USDC',
    valueInMyr: 70.00,
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    description: 'Every child deserves a chance to dream. May this donation help provide education, care, and a safe place for the little ones."',
    userPhoto: AppImages.imageUserCF2,
  ),
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: 'tx123',
    donorId: 'Lim Jia Ying',
    charityId: 'OrphanCARE Foundation',
    transactionValue: 0.015,
    cryptoUsed: 'BTC',
    valueInMyr: 4500.00,
    timestamp: DateTime.now().subtract(Duration(minutes: 10)),
    description: 'No child should grow up alone. Wishing all children a loving and warm family to call their own.',
    userPhoto: AppImages.imageUserCM2,
  ),
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: 'tx124',
    donorId: 'Zize',
    charityId: 'The Lost Food Project',
    transactionValue: 0.02,
    cryptoUsed: 'ETH',
    valueInMyr: 360.00,
    timestamp: DateTime.now().subtract(Duration(hours: 1)),
    description: 'Food waste is preventable, and hunger is solvable. May this contribution help feed more people in need.',
    userPhoto: AppImages.imageUserCF1,
  ),
  Transaction(
    hash: BlockchainHelper.generateMockHash(),
    transactionId: 'tx125',
    donorId: 'Karry',
    charityId: 'Mercy Malaysia',
    transactionValue: 0.50,
    cryptoUsed: 'USDC',
    valueInMyr: 235.00,
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    description: 'Sending love and prayers to those affected by disasters and crises. May this donation aid in relief efforts and healing.',
    userPhoto: AppImages.imageUserCM1,
  ),
];
