import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/screens/main/main_screen.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class WaitingPage extends StatefulWidget {
  const WaitingPage({super.key});

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppImages.backGroundImage.path,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: height / 1.25,
                    width: width / 1.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        50.h.verticalSpacer,
                        Text(
                          'Earn Your Way To',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        8.h.verticalSpacer,
                        Text(
                          'Amazing Discounts',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        16.h.verticalSpacer,
                        Text(
                          'Start with a FREE dish after your first',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'order throught Piccadilly and that\'s',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        23.h.verticalSpacer,
                        Text(
                          'Just the begining',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        50.h.verticalSpacer,
                        Image.asset(AppImages.riceBowl.path),
                        50.h.verticalSpacer,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: () {}, child: Text('LogIn'))),
                            24.horizontalSpacer,
                            Expanded(
                                child: OutlinedButton(
                                    onPressed: () {}, child: Text('Sign Up')))
                          ],
                        ),
                        15.h.verticalSpacer,
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Get.to(
                                  MainPage(),
                                );
                              },
                              child: Text('Continue as guest')),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
