import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:hyperce/constants/app_colors.dart";
import "package:hyperce/screens/main/First_Page.dart";
import "package:hyperce/utils/extensions/num_extensions.dart";
import "package:hyperce/utils/images.dart";

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({super.key});

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("height:" + height.toString());
    print("width:" + width.toString());
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                AppImages.bg_image2.path,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                height: height / 1.2427,
                width: width / 1.0,
              ),
              //picadilly image almost at the top
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.piccadilly.path,
                    width: 64,
                    height: 37,
                  ),
                ),
              ),
            ],
          ),
          15.verticalSpacer,
          Center(
            child: Text(
              "Let's get Started",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(24),
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          15.verticalSpacer,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: CupertinoButton(
              padding: EdgeInsets.all(10.0),
              pressedOpacity: 0.7,
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 50.horizontalSpace,
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    // letterSpacing: 0.8,
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
        ],
      )),
    );
  }
}
