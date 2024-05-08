import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/catering_full_menu/catering_full_menu.dart';
import 'package:hyperce/screens/delievery_page/resturant_information.dart';
import 'package:hyperce/screens/map/models/resturants_model.dart';
import 'package:hyperce/screens/menu_page/menu_page.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class ResturantsCard extends StatefulWidget {
  final bool isCatering;
  final ResturantsModel appResturants;
  const ResturantsCard(
      {super.key, required this.isCatering, required this.appResturants});

  @override
  State<ResturantsCard> createState() => _ResturantsCardState();
}

class _ResturantsCardState extends State<ResturantsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpacer,
                  Text(
                    widget.appResturants.name,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  8.verticalSpacer,
                  Text(widget.appResturants.location,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  11.verticalSpacer,
                  Row(
                    children: [
                      Text('Open.',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          )),
                      Text("Closes 10:00 pm",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ],
              ),
              100.horizontalSpacer,
              Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(AppImages.picadillyPLogo.path)),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Image.asset(AppImages.indoorPickUp.path),
              8.horizontalSpacer,
              Text('indoor pickup '),
              12.horizontalSpacer,
              Image.asset(AppImages.verticalDivider.path),
              12.horizontalSpacer,
              Image.asset(AppImages.driveThrough.path),
              8.horizontalSpacer,
              Text('Curbside pickup '),
            ],
          ),
          12.verticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.timeIcon.path),
                  8.horizontalSpacer,
                  Text('Next available: 7-13 mins'),
                ],
              ),
              65.horizontalSpacer,
              GestureDetector(
                  onTap: () {
                    Get.to(ResturantInformation());
                  },
                  child: Icon(CupertinoIcons.info_circle)),
            ],
          ),
          18.verticalSpacer,
          Container(
            width: 300,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    widget.isCatering ? CateringFullMenu() : MenuPage(),
                  );
                },
                child: Text('Start Order')),
          )
        ],
      ),
    ));
  }
}
