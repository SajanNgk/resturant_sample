import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/my_cart/widget/my_cart_card.dart';
import 'package:hyperce/screens/my_cart/widget/payment_summary_card.dart';
import 'package:hyperce/screens/payment_screen/payment_scree.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpacer,
                  Center(
                    child: Text('My Cart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  34.verticalSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Address:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          4.verticalSpacer,
                          Text(
                            '3610 Sadge Location',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: AppColors
                                    .mainColor), // Set the border color here
                          ),
                          onPressed: () {},
                          child: Text(
                            'Change Location',
                            style: TextStyle(color: AppColors.mainColor),
                          ))
                    ],
                  ),
                  24.verticalSpacer,
                  CartCart(),
                  16.verticalSpacer,
                  CartCart(),
                  16.verticalSpacer,
                  CartCart(),
                  40.verticalSpacer,
                  PaymentSummaryCard(),
                  20.verticalSpacer,
                  Container(
                    width: 327,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(PaymentScreen());
                        },
                        child: Text('Order Now')),
                  ),
                  34.verticalSpacer,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
