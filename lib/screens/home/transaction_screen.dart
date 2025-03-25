import 'package:fidefund/models/transaction_model.dart';
import 'package:fidefund/controllers/transaction_controller.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({Key? key}) : super(key: key);

  final List<Transaction> transactions = TransactionController().mockTransaction;

  // Calculate total amount
  double getTotalDonated() {
    return transactions.fold(0, (sum, item) => sum + item.amountMYR);
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = getTotalDonated();

    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You have donated",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${totalAmount.toStringAsFixed(2)} MYR", 
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "on March 2025",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Pie Chart (Fixed at the Top)
            SizedBox(
              height: 220,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 0, 
                  sections: [
                    PieChartSectionData(
                      color: AppColors.darkBlue,
                      value: 75,
                      title: "75% \nEducation",
                      titleStyle: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      radius: 110,
                    ),
                    PieChartSectionData(
                      color: AppColors.secondaryBlue,
                      value: 25,
                      title: "25% \nCommunity",
                      titleStyle: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      radius: 110,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Transactions List Title & Filter Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transactions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.filter_list, color: Colors.black), 
              ],
            ),
            const SizedBox(height: 10),

            // Scrollable Transaction List
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return _buildTransactionItem(transactions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Transaction Item Widget
  Widget _buildTransactionItem(Transaction transaction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.school, color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            transaction.campaignTitle, 
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            DateFormat("dd MMM yyyy").format(transaction.createdAt),
                            style: const TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              Expanded(
                flex: 1, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${transaction.amountMYR.toStringAsFixed(2)} MYR",
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                    ),
                    if (transaction.amountCrypto != null)
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "≈ ${transaction.amountCrypto!.toStringAsFixed(6)} ${transaction.Cryptocurrency}",
                          style: const TextStyle(fontSize: 12, color: Colors.black54),
                          maxLines: 1,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
