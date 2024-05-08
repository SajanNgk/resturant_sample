import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/screens.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';
import 'package:latlong2/latlong.dart';

class DelieveryStatus extends StatefulWidget {
  const DelieveryStatus({super.key});

  @override
  State<DelieveryStatus> createState() => _DelieveryStatusState();
}

class _DelieveryStatusState extends State<DelieveryStatus> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(AppImages.backIcon.path)),
            Text(
              'Delievery Status',
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Container(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.h,
              child: FlutterMap(
                options: MapOptions(
                  //   initialCenter:LatLng(27.69931253750306,85.28030659926833) ,
                  initialCenter: LatLng(
                    27.6887,
                    85.2898,
                  ),
                  initialZoom: 16,
                ),
                children: [
                  // TileLayer(
                  //   urlTemplate:
                  //       'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  //   userAgentPackageName:
                  //       'dev.fleaflet.flutter_map.example',
                  //   // Plenty of other options available!
                  // ),
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(27.6887, 85.2898),
                        width: 20,
                        height: 20,
                        child: Image.asset(AppImages.mapMarker.path),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            15.verticalSpacer,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Estimated time of delivery',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '9:45',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  22.verticalSpacer,
                  _buildUserCard(),
                  8.verticalSpacer,
                  Text(
                    'John Doe is vaccinated and was sanitized before the food was handed over to him for delivery.',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                  17.verticalSpacer,
                  Divider(),
                  14.verticalSpacer,
                  Text('Track you order'),
                  Container(height: 200, child: _buildStepperContainer()),
                  27.verticalSpacer,
                  Container(
                    width: 331,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(MainPage());
                        },
                        child: Text('Got To Home')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildUserCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.verticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 50, child: Image.asset(AppImages.userProfile.path)),
              13.horizontalSpacer,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("John Doe"),
                  Text(
                    'Your Delievery Guy',
                    style: TextStyle(fontSize: 9),
                  ),
                  8.verticalSpacer,
                  Text(
                    'John’s profile description or so',
                    style: TextStyle(fontSize: 9),
                  ),
                ],
              ),
              Image.asset(AppImages.callIcon.path)
            ],
          ),
          14.verticalSpacer,
        ],
      ),
    );
  }

  Widget _buildStepperContainer() {
    return Stepper(
      currentStep: _currentStep,
      onStepContinue: () {
        setState(() {
          if (_currentStep < 4) {
            _currentStep += 1;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (_currentStep > 0) {
            _currentStep -= 1;
          }
        });
      },
      steps: [
        Step(
          title: Text('Order Confirmed'),
          content: Text('Your order has been confirmed.'),
          isActive: _currentStep >= 0,
        ),
        Step(
          title: Text('Order is Being Prepared'),
          content: Text('We are preparing your order.'),
          isActive: _currentStep >= 1,
        ),
        Step(
          title: Text('Order Prepared'),
          content: Text('Your order is prepared and ready for shipment.'),
          isActive: _currentStep >= 2,
        ),
        Step(
          title: Text('Delivery in Progress'),
          content: Text('Your order is on its way to your location.'),
          isActive: _currentStep >= 3,
        ),
        Step(
          title: Text('Delivery Successfully Done'),
          content: Text('Your order has been successfully delivered.'),
          isActive: _currentStep >= 4,
        ),
      ],
    );
  }
}
