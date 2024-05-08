import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/delievery_page/delievery_to_me_page.dart';
import 'package:hyperce/screens/map/models/resturants_model.dart';
import 'package:hyperce/screens/map/widgets/resturants_card.dart';
import 'package:hyperce/utils/images.dart';
import 'package:hyperce/utils/size_config.dart';
import 'package:latlong2/latlong.dart';

class ShowMap extends StatefulWidget {
  bool isCatering;
  ShowMap({required this.isCatering});

  @override
  State<ShowMap> createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                  'Select a resturant',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Image.asset(AppImages.storeLogo.path)
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.mainColor,
              padding: EdgeInsets.symmetric(vertical: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(AppImages.searchIcon.path),
                  Text(
                    'Enter restaurant name/state name',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(DeliveryToMePage());
                      },
                      child: Image.asset(AppImages.listIcon.path))
                ],
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight!,
                  width: double.infinity,
                  child: FlutterMap(
                    options: MapOptions(
                      initialCenter: LatLng(
                        32.89287059456767,
                        -96.96642812214303,
                      ),
                      initialZoom: 16,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: ResturantsModel.resturants
                            .map((restaurant) => Marker(
                                  point: LatLng(
                                      double.parse(restaurant.lattitude),
                                      double.parse(restaurant.longitude)),
                                  width: 60,
                                  height: 60,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        AppImages.mapMarker.path,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 140.0,
                  left: 20.0,
                  right: 0.0,
                  child: SizedBox(
                    height: 230,
                    child: ListView.builder(
                      itemCount: ResturantsModel.resturants.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final appResturants = ResturantsModel.resturants[index];
                        return Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ResturantsCard(
                                isCatering: widget.isCatering,
                                appResturants: appResturants));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
