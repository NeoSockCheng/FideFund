import 'dart:async';
import 'dart:math';
import 'package:fidefund/screens/real_time/real_time_bottom.dart/recent_transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fidefund/models/transaction_model.dart';

class TransactionBubbleList extends StatefulWidget {
  final double height;

  const TransactionBubbleList({Key? key, this.height = 360.0}) : super(key: key);

  @override
  _TransactionBubbleListState createState() => _TransactionBubbleListState();
}

class _TransactionBubbleListState extends State<TransactionBubbleList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<Transaction> _transactions;
  Timer? _timer;
  final Random _random = Random();

  // Mock Data
  final List<Transaction> mockTransactions = [
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
    Transaction(
      transactionId: 'tx126',
      donorId: 'donor4',
      charityId: 'charityD',
      transactionValue: 0.15,
      btcUsed: 0.00225,
      valueInMyr: 4500.00,
      timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      description: 'Feeding hungry children.',
    ),
    Transaction(
      transactionId: 'tx127',
      donorId: 'donor5',
      charityId: 'charityE',
      transactionValue: 0.30,
      btcUsed: 0.0045,
      valueInMyr: 9000.00,
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      description: 'Helping disaster relief efforts.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _transactions = List.from(mockTransactions.take(3)); // Initialize with first 3 transactions
    _startMockTransactions();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startMockTransactions() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      addTransaction(mockTransactions[_random.nextInt(mockTransactions.length)]);
    });
  }

  void addTransaction(Transaction transaction) {
    setState(() {
      if (_transactions.length >= 3) {
        _removeOldestTransaction();
      }
      _transactions.insert(0, transaction);
      _listKey.currentState?.insertItem(0, duration: const Duration(milliseconds: 300));
    });
  }

  void _removeOldestTransaction() {
    _listKey.currentState?.removeItem(
      _transactions.length - 1,
      (context, animation) => _buildTransactionBubble(_transactions.last, animation),
      duration: const Duration(milliseconds: 300),
    );
    _transactions.removeLast();
  }

  Widget _buildTransactionBubble(Transaction transaction, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TransactionItem(transaction: transaction),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // White background
        borderRadius: BorderRadius.circular(12), // Optional: rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Light shadow
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SizedBox(
        height: widget.height,
        child: AnimatedList(
          key: _listKey,
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          initialItemCount: _transactions.length,
          itemBuilder: (context, index, animation) {
            return _buildTransactionBubble(_transactions[index], animation);
          },
        ),
      ),
    );
  }

}
