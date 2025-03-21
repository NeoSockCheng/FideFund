import 'package:fidefund/screens/real_time/real_time_bottom.dart/real_time_bottom_view.dart';
import 'package:flutter/material.dart';
import 'package:fidefund/models/transaction_model.dart';
import 'package:fidefund/screens/real_time/real_time_top/real_time_app_bar.dart';

class RealTimePage extends StatelessWidget {
  const RealTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const RealTimeAppBar(),
          RealTimeBottomView(transactions: mockTransactions),
        ],
      ),
    );
  }
}
