import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/map/map.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class CateringLocaation extends StatefulWidget {
  const CateringLocaation({super.key});

  @override
  State<CateringLocaation> createState() => _CateringLocaationState();
}

class _CateringLocaationState extends State<CateringLocaation> {
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
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(AppImages.backIcon.path)),
                62.horizontalSpacer,
                Text(
                  'Order Catering',
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            34.verticalSpacer,
            Text(
              'Piccadilly Cafeteria Catering',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            28.verticalSpacer,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Enter location for catering',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            4.verticalSpacer,
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_pin),
                  hintText: 'San Diego, Washington'),
            ),
            20.verticalSpacer,
            Container(
                width: 326,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(ShowMap(
                        isCatering: true,
                      ));
                    },
                    child: Text('View Resturants')))
          ],
        ),
      ),
    );
  }
}
