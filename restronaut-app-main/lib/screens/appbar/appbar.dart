import 'package:flutter/material.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/images.dart';

class RestroAppBar extends StatelessWidget {
  const RestroAppBar();
  // const RestroAppBar(
  //     {super.key,
  //     this.actionWidget,
  //     this.title,
  //     this.isCenterTile = false,
  //     this.isDashboard = false,
  //     this.isLeading = true});
  // final Widget? actionWidget;
  // final String? title;
  // final bool isCenterTile;
  // final bool isDashboard;
  // final bool isLeading;

  @override
  Widget build(BuildContext context) {
    return _buildDefaultAppBAr(context);
  }

  _buildDefaultAppBAr(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
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
    );
  }
}
