import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OurSpinner extends StatelessWidget {
  const OurSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      // lineWidth: ScreenUtil().setSp(3),
      // itemCount: 5,
      size: ScreenUtil().setSp(60),
      color: darkgoldenLogoColor,
    );
  }
}
