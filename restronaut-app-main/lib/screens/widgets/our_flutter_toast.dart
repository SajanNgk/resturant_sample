import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OurToast {
  showSuccessToast(String string) => Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: darkLogoColor,
        textColor: Colors.white,
        fontSize: ScreenUtil().setSp(15),
      );

  showErrorToast(String string) => Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: darkLogoColor,
        textColor: Colors.white,
        fontSize: ScreenUtil().setSp(15),
      );
}
