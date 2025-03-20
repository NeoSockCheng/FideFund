import 'package:fidefund/models/transaction_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/utils/app_images.dart';
import 'package:fidefund/widgets/circle_avatar.dart';
import 'package:fidefund/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class RealTimeTransactionsCard extends StatelessWidget {
  const RealTimeTransactionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch all transactions
    List<Transaction> transactions = mockTransactions;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < transactions.length; i++) ...[
            _buildTransactionItem(transactions[i], context),
            if (i != transactions.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Divider(color: Colors.grey.shade300, thickness: 1),
              ),
          ],
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(Transaction transaction, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Donor Avatar, Name, and Description
            Row(
              children: [
                CustomCircularAvatar(
                  radius: 20,
                  imagePath: AppImages.imageUserProfile1,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.donorId,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      transaction.description,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),

            /// Donation Amount
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${transaction.btcUsed} BTC",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "(~MYR ${transaction.valueInMyr})",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),

        /// Timestamp at the bottom of the transaction item
        /// Donation Amount and Timestamp
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '2025.1.1 12:12:11', // Assuming timestamp is a string in Transaction model
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            CustomTextButton(
              onPressed: () {},
              text: 'kjaehae...jdkljafd',
              color: AppColors.primaryBlue,
            ),
          ],
        ),
      ],
    );
  }
}
