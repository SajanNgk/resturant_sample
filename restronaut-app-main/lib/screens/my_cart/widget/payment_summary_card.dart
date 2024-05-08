import 'package:flutter/material.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';

class PaymentSummaryCard extends StatelessWidget {
  const PaymentSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.mainColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.verticalSpacer,
          Text(
            'Payment Summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          8.verticalSpacer,
          _buildPaymentSummaryContents('Total Items (3)', '\48.55'),
          16.verticalSpacer,
          _buildPaymentSummaryContents('Delievery Fee', 'Free'),
          16.verticalSpacer,
          _buildPaymentSummaryContents('Discount', '-\$10'),
          16.verticalSpacer,
          _buildPaymentSummaryContents('Total', '\$38.45'),
          12.verticalSpacer,
        ],
      ),
    );
  }

  Widget _buildPaymentSummaryContents(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
