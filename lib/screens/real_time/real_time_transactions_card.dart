import 'package:fidefund/models/transaction_model.dart';
import 'package:fidefund/theme/colors.dart';
import 'package:fidefund/utils/app_images.dart';
import 'package:flutter/material.dart';

class RealTimeTransactionsCard extends StatelessWidget {
  final Transaction transaction;
  final bool isFirst;

  const RealTimeTransactionsCard({Key? key, required this.transaction, this.isFirst = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFirst ? double.infinity : null,
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondaryBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(backgroundImage: AssetImage(AppImages.imageUserProfile1)),
              Column(
                children: [
                  Text("Donated", style: TextStyle(fontSize: 14)),
                  Text("${transaction.btcUsed} BTC", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("(~MYR ${transaction.valueInMyr})", style: TextStyle(fontSize: 14)),
                ],
              ),
              CircleAvatar(backgroundImage: AssetImage(AppImages.imageCharityProfile1)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(transaction.donorId, style: TextStyle(fontWeight: FontWeight.bold)),
              Text("To"),
              Text(transaction.charityId, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          if (isFirst) ...[
            SizedBox(height: 8),
            Text(
              transaction.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
          ]
        ],
      ),
    );
  }
}
