class Transaction {
  final String transactionId;
  final String donorId;
  final String charityId;
  final double transactionValue;
  final double btcUsed;
  final double valueInMyr;
  final DateTime timestamp;
  final String description;

  Transaction({
    required this.transactionId,
    required this.donorId,
    required this.charityId,
    required this.transactionValue,
    required this.btcUsed,
    required this.valueInMyr,
    required this.timestamp,
    required this.description,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transaction_id'],
      donorId: json['donor_id'],
      charityId: json['charity_id'],
      transactionValue: (json['transaction_value'] as num).toDouble(),
      btcUsed: (json['btc_used'] as num).toDouble(),
      valueInMyr: (json['value_in_myr'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_id': transactionId,
      'donor_id': donorId,
      'charity_id': charityId,
      'transaction_value': transactionValue,
      'btc_used': btcUsed,
      'value_in_myr': valueInMyr,
      'timestamp': timestamp.toIso8601String(),
      'description': description,
    };
  }
}

// Mock Data
List<Transaction> mockTransactions = [
  Transaction(
    transactionId: 'tx123',
    donorId: 'donor1',
    charityId: 'charityA',
    transactionValue: 0.05,
    btcUsed: 0.00075,
    valueInMyr: 1500.00,
    timestamp: DateTime.now().subtract(Duration(minutes: 10)),
    description: 'Donation for education program.',
  ),
  Transaction(
    transactionId: 'tx124',
    donorId: 'donor2',
    charityId: 'charityB',
    transactionValue: 0.10,
    btcUsed: 0.0015,
    valueInMyr: 3000.00,
    timestamp: DateTime.now().subtract(Duration(hours: 1)),
    description: 'Supporting healthcare initiative.',
  ),
  Transaction(
    transactionId: 'tx125',
    donorId: 'donor3',
    charityId: 'charityC',
    transactionValue: 0.20,
    btcUsed: 0.003,
    valueInMyr: 6000.00,
    timestamp: DateTime.now().subtract(Duration(days: 1)),
    description: 'Helping build clean water access.',
  ),
];