import 'package:fidefund/screens/real_time/real_time_transactions_card.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/models/transaction_model.dart';

class RealTimePage extends StatelessWidget {
  const RealTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: mockTransactions.length,
        itemBuilder: (context, index) {
          return RealTimeTransactionsCard(transaction: mockTransactions[index]);
        },
      ),
    );
  }
}