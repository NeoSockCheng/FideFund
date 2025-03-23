import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/models/payment_release_model.dart';
import 'package:fidefund/controllers/payment_release_controller.dart';

class CharityPaymentReleasePage extends StatelessWidget {
  CharityPaymentReleasePage({Key? key}) : super(key: key);

  final List<PaymentRelease> payments = PaymentReleaseController().mockPaymentReleases;

  double getTotalReceived() {
    return payments.fold(0, (sum, item) => sum + item.amountMYR);
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = getTotalReceived();

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
              "You have received",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MYR ${totalAmount.toStringAsFixed(0)}",
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "on March 2025",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                      title: "75%\nProject 2",
                      titleStyle: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      radius: 110,
                    ),
                    PieChartSectionData(
                      color: AppColors.secondaryBlue,
                      value: 25,
                      title: "25%\nProject 1",
                      titleStyle: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      radius: 110,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  return _buildPaymentItem(payments[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentItem(PaymentRelease payment) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(payment.campaignImage),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    payment.campaignTitle,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat("dd MMM yyyy").format(payment.createdAt),
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "MYR ${payment.amountMYR.toStringAsFixed(0)}",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "${payment.hash.substring(0, 6)}...${payment.hash.substring(payment.hash.length - 4)}",
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
