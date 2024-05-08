import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../api/db/db_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        finishButtonText: 'Continue',
        onFinish: () async {
          await Hive.box<int>(DatabaseHelper.outerlayerDB).put("state", 1);
        },
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: darkLogoColor,
        ),
        skipTextButton: Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            color: darkLogoColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Text(
          'Get Started',
          style: TextStyle(
            fontSize: 16,
            color: darkLogoColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailingFunction: () async {
          print("hello World");
          await Hive.box<int>(DatabaseHelper.outerlayerDB).put("state", 1);
        },
        controllerColor: darkLogoColor,
        totalPage: 3,
        headerBackgroundColor: Colors.white,
        pageBackgroundColor: Colors.white,
        background: [
          Image.asset(
            'assets/firstScreen.png',
            height: ScreenUtil().setSp(425),
          ),
          Image.asset(
            'assets/secondScreen.png',
            height: ScreenUtil().setSp(425),
          ),
          Image.asset(
            'assets/thirdScreen.png',
            height: ScreenUtil().setSp(425),
          ),
        ],
        centerBackground: true,
        speed: 1.8,
        pageBodies: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(35),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                Text(
                  'Get Any Thing Online',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: darkLogoColor,
                    fontSize: ScreenUtil().setSp(18.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                OurSizedBox(),
                Text(
                  'You can buy anything ranging from digital products to hardware within few clicks.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(35),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                Text(
                  'Shipping to anywhere ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: darkLogoColor,
                    fontSize: ScreenUtil().setSp(18.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                OurSizedBox(),
                Text(
                  'We will ship to anywhere in the world, With 30 day 100% money back policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(35),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
                Text(
                  'Start now!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: darkLogoColor,
                    fontSize: ScreenUtil().setSp(18.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                OurSizedBox(),
                Text(
                  'Where everything is possible and customize your onboarding.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
