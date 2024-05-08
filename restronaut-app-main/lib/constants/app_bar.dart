import 'package:flutter/material.dart';
import 'package:hyperce/utils/images.dart';

class MyAppBar {
  static Widget getAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppImages.crossIcon.path,
              height: 40,
              width: 40,
              color: Colors.black,
            )),
        Image.asset(AppImages.storeLogo.path)
      ],
    );
  }
}
