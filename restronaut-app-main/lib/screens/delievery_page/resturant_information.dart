import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';
import 'package:latlong2/latlong.dart';

class ResturantInformation extends StatefulWidget {
  const ResturantInformation({super.key});

  @override
  State<ResturantInformation> createState() => _ResturantInformationState();
}

class _ResturantInformationState extends State<ResturantInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
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
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
          16.verticalSpacer,
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Las Colinas',
                    style: TextStyle(
                      color: AppColors.appTextSecondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  8.verticalSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Irving',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '0.12 miles',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  8.verticalSpacer,
                  Text(
                    '9707503822',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  8.verticalSpacer,
                  Divider(),
                  12.verticalSpacer,
                  Text(
                    'Order Options',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.appTextSecondaryColor),
                  ),
                  8.verticalSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(AppImages.indoorPickupIcon.path),
                      Text(
                        'indoor pickup',
                        style: TextStyle(fontSize: 10),
                      ),
                      Image.asset(AppImages.verticalDivider.path),
                      Image.asset(AppImages.curbsidePickupIcon.path),
                      Text(
                        'curbside pickup',
                        style: TextStyle(fontSize: 10),
                      ),
                      Image.asset(AppImages.verticalDivider.path),
                      Image.asset(AppImages.delieveryIcon.path),
                      Text(
                        'Delievery',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  8.verticalSpacer,
                  Divider(),
                  10.verticalSpacer,
                  Text(
                    'Drive In Hours',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.appTextSecondaryColor),
                  ),
                  8.verticalSpacer,
                  _buildDriveInHours('Monday', '06:00am - 10:00am'),
                  _buildDriveInHours('Tuesday', '06:00am - 10:00am'),
                  _buildDriveInHours('Wednesday', '06:00am - 10:00am'),
                  _buildDriveInHours('Thursday', '06:00am - 10:00am'),
                  _buildDriveInHours('Friday', '06:00am - 10:00am'),
                  _buildDriveInHours('Sunday', '06:00am - 10:00am'),
                  8.verticalSpacer,
                  Text(
                    'Curbside Hours',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.appTextSecondaryColor),
                  ),
                  8.verticalSpacer,
                  _buildDriveInHours('Monday', '06:00am - 10:00am'),
                  _buildDriveInHours('Tuesday', '06:00am - 10:00am'),
                  _buildDriveInHours('Wednesday', '06:00am - 10:00am'),
                  _buildDriveInHours('Thursday', '06:00am - 10:00am'),
                  _buildDriveInHours('Friday', '06:00am - 10:00am'),
                  _buildDriveInHours('Sunday', '06:00am - 10:00am'),
                  16.verticalSpacer,
                  Container(
                    width: 326.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Start Order',
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDriveInHours(String day, String timing) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            8.verticalSpacer,
            Text(
              timing,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        8.verticalSpacer,
      ],
    );
  }
}
