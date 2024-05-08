import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/delievery_status/delievery_status.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<String> _paymentPlatform = ['Apple Pay', 'Paypal', 'stripe'];
  late String _selectedLinkType = _paymentPlatform[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(AppImages.backIcon.path)),
                Text(
                  'Checkout',
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Image.asset(AppImages.storeLogo.path)
              ],
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            37.verticalSpacer,
            Text(
              'Payment Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            19.verticalSpacer,
            DropdownButtonFormField(
              value: _paymentPlatform[0],
              items: _paymentPlatform
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (String? v) {
                setState(() {
                  _selectedLinkType = v!;
                });
              },
            ),
            33.verticalSpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '38.45',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            4.verticalSpacer,
            Divider(),
            16.verticalSpacer,
            Container(
                width: 326,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(DelieveryStatus());
                    },
                    child: Text('Continue')))
          ],
        ),
      ),
    );
  }
}
