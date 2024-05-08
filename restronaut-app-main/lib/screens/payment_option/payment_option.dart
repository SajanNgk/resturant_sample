import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/screens/payment_option/widgets/payment_card.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.verticalSpacer,
              Text('Payment Method', style: TextStyle(fontSize: 18.sp)),
              28.verticalSpacer,
              PaymentCard(),
              31.h.verticalSpacer,
              Text('Card Holder'),
              8.h.verticalSpacer,
              TextFormField(
                decoration: InputDecoration(hintText: 'Matilda Brown'),
              ),
              31.h.verticalSpacer,
              Text('Card Number'),
              8.h.verticalSpacer,
              TextFormField(
                decoration: InputDecoration(
                  hintText: '558 8584 9584',
                ),
              ),
              31.h.verticalSpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Expriy Date'),
                        8.h.verticalSpacer,
                        TextFormField(
                          decoration: InputDecoration(hintText: '01/25'),
                        ),
                      ],
                    ),
                  ),
                  30.horizontalSpacer,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CVV'),
                        8.h.verticalSpacer,
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: '000',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  5.horizontalSpacer,
                  Text('Save to my Cards')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
