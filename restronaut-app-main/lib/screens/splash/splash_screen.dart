import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/screens/authentication/sign_up_screen.dart';
import 'package:hyperce/utils/images.dart';
import 'package:hyperce/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AnimationController controller;

  double _progressValue = 0.0;

  bool useTimer = true; // Set this to false if you want to skip the timer

  @override
  void initState() {
    super.initState();

    if (useTimer) {
      startTimer();
    } else {
      navigateToOuterLayer();
    }
  }

  void startTimer() {
    Timer.periodic(
      Duration(milliseconds: 1000),
      (timer) {
        setState(() {
          _progressValue += 0.1;
        });

        if (_progressValue >= 1.0) {
          timer.cancel();

          navigateToOuterLayer();
        }
      },
    );
  }

  void navigateToOuterLayer() {
    Utility.navigateTo(
      context,
      SignUpScreen(),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          height: double.infinity,
          width: double.infinity,
          AppImages.splash.path,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget textSpan(String s1, String s2) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "$s1\n",
            style: TextStyle(
              fontFamily: "CS_Rocky",
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(81, 32, 10, 1),
              // color: rgba(81, 32, 10, 1),
            ),
          ),
          TextSpan(
            text: "$s2",
            style: TextStyle(
              // fontFamily: "RocaOne",
              fontSize: 40.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(81, 32, 10, 1),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
//  child: Image.asset(AppImages.piccadilly.path),
