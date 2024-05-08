import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hyperce/screens/home_page/widgets/restronaut_text_field.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class MyCheckoutPage extends StatelessWidget {
  const MyCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.h.verticalSpacer,
            GestureDetector(
              child: Image.asset(AppImages.leftArrow.path),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            15.h.verticalSpacer,
            Text(
              'Checkout',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.map),
                      Text('New York'),
                    ],
                  ),
                ),
                Image.asset(AppImages.rightArrow.path),
              ],
            ),
            20.verticalSpacer,
            RestronauTextField(
              hintText: 'Add directions',
              height: 52.h,
              width: 400,
            ),
            20.h.verticalSpacer,
            Text('Order Summary',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
            10.h.verticalSpacer,
            _buildFoodOrderSummaryContainer('Mc donald'),
            Divider(),
            _buildFoodOrderSummaryContainer('StarBucks'),
            Divider(),
            100.h.verticalSpacer,
            ElevatedButton(onPressed: () {}, child: Text('Place order'))
          ],
        ),
      ),
    );
  }

  Widget _buildFoodOrderSummaryContainer(
    String brandName,
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          5.h.verticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(brandName),
              Container(
                  width: 50,
                  height: 30,
                  child: Image.asset(AppImages.starbucks.path)),
            ],
          ),
          10.horizontalSpacer,
          Text('Crossians'),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Each \$ 7.5"),
            Container(
              child: Row(
                children: [
                  Container(
                    child: Icon(Icons.remove),
                  ),
                  5.w.horizontalSpacer,
                  Text(
                    '2',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  5.w.horizontalSpacer,
                  Container(
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            )
          ]),
          10.horizontalSpacer,
          Text('Crossians'),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Each \$ 7.5"),
            Row(
              children: [
                Container(
                  child: Icon(Icons.remove),
                ),
                5.w.horizontalSpacer,
                Text(
                  '2',
                  style: TextStyle(fontSize: 18.sp),
                ),
                5.w.horizontalSpacer,
                Container(
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
