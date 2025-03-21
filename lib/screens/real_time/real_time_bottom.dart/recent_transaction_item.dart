import 'package:fidefund/models/currency_model.dart';
import 'package:fidefund/models/transaction_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/utils/blockchain_helper.dart';
import 'package:fidefund/widgets/circle_avatar.dart';
import 'package:fidefund/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Color backgroundColor; // New parameter for card color

  const TransactionItem({
    Key? key,
    required this.transaction,
    this.backgroundColor = AppColors.secondaryBlue, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = Currency.fromString(transaction.cryptoUsed);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor, // Apply background color
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
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
                    radius: 15,
                    imagePath: transaction.userPhoto,
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4, // Limit width to 60%
                        child: Text(
                          transaction.description,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              /// Donation Amount
              /// Donation Amount with Currency Image
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "${transaction.transactionValue} ${transaction.cryptoUsed.toUpperCase()}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        currency.image,
                        width: 15,
                        height: 15,
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                  Text(
                    "(~MYR ${transaction.valueInMyr})",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    text: BlockchainHelper.generateShortenHash(),
                    color: AppColors.primaryBlue,
                    fontSize: 12,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),

          /// Timestamp and Action Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              
            ],
          ),
        ],
      ),
    );
  }
}
