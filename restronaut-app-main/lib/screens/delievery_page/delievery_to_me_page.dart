import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/delievery_page/resturant_information.dart';
import 'package:hyperce/screens/menu_page/menu_page.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class DeliveryToMePage extends StatefulWidget {
  const DeliveryToMePage({super.key});

  @override
  State<DeliveryToMePage> createState() => _DeliveryToMePageState();
}

class _DeliveryToMePageState extends State<DeliveryToMePage>
    with TickerProviderStateMixin {
  @override
  late final TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  final tabs = ['Nearby', 'Recents', 'Favourites'];

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
                    'Locations',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image.asset(AppImages.locations.path)
                ],
              ),
              //
            ],
          ),
        ),
        drawerEnableOpenDragGesture: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              controller: _tabController,
              tabs: tabs
                  .map(
                    (tab) => Tab(
                      child: Text(
                        tab,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                  .toList(),
            ),
            _buildDelieveryCard('North Berlin Road', '10-12 minutes'),
            _buildDelieveryCard('Las Polos', '10-12 minutes'),
            _buildDelieveryCard('Las Colinas', '10-12 minutes'),
            _buildDelieveryCard('North Berlin Road', '10-12 minutes'),
          ],
        ),
      ),
    );
  }

  Widget _buildDelieveryCard(String address, String time) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: AppColors.lineDivider))),
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          16.verticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.heartSelected.path,
                    width: 20,
                  ),
                  3.horizontalSpacer,
                  GestureDetector(
                      onTap: () {
                        Get.to(ResturantInformation());
                      },
                      child: Icon(Icons.info_outline)),
                ],
              ),
            ],
          ),
          5.verticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '0.7 miles . Open',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "delievery time $time",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 10,
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    Get.to(MenuPage());
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 2)),
                  child: Text(
                    'Start My Order',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainColor,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget getWidget(String place) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //  Image.asset(AppImages.delivery_image.path),
              Icon(CupertinoIcons.info_circle)
            ],
          ),
          08.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                place,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.transparent,
                  child: Text(
                    "Start My Order",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 212, 82, 49),
                    ),
                  ),
                  onPressed: () {
                    Get.to(ResturantInformation());
                  },
                ),
              ),
            ],
          ),
          1.verticalSpace,
          Text("Delivery Time: 10-12 minutes"),
        ],
      ),
    );
  }
}
