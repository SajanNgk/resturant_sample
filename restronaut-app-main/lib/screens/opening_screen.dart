import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:hyperce/constants/app_colors.dart";
import "package:hyperce/screens/main/First_Page.dart";
import "package:hyperce/utils/images.dart";

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Picadillly image logo
          Flexible(
            // flex: 10,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.piccadilly.path,
                width: 186.w,
                height: 104.h,
              ),
            ),
          ),
          // 15.verticalSpacer,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Welcome to Picadilly",
                  style: TextStyle(
                    letterSpacing: -1,
                    fontSize: 28.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // 20.verticalSpacer,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17.0,
                  vertical: 10,
                ),
                child: CupertinoButton(
                  padding: EdgeInsets.symmetric(
                    // horizontal: 10.0,
                    vertical: 18,
                  ),
                  pressedOpacity: 0.5,
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Get.to(
                      First_Page(),
                    );
                  },
                ),
              ),
              // OutlinedButton(onPressed: First_Page, child: child)
            ],
          )
        ],
      )),
    );
  }
}
