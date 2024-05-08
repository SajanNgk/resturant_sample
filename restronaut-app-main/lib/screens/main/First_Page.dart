import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/authentication/EmailLoginPage.dart';
import 'package:hyperce/screens/authentication/sign_up_screen.dart';
import 'package:hyperce/screens/screens.dart';
import 'package:hyperce/utils/images.dart';

class First_Page extends StatefulWidget {
  const First_Page({super.key});

  @override
  State<First_Page> createState() => _First_PageState();
}

class _First_PageState extends State<First_Page> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: Stack(
            children: [
              //background image
              Container(
                width: width,
                height: height,
                child: Image.asset(
                  AppImages.backGroundImage.path,
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                ),
              ),
              //
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 81),
                          child: Text("EARN YOUR WAY TO",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        //
                        5.verticalSpace,
                        Text(
                          "AMAZING DISCOUNTS",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        18.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0),
                          child: Text(
                              "Start with a FREE dish after your first order through Piccadilly and that’s.",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        25.verticalSpace,
                        Text(
                          "JUST THE BEGINNING",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(AppImages.initial_food.path),
                    50.verticalSpace,
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CupertinoButton(
                                  padding: EdgeInsets.all(13),
                                  pressedOpacity: 0.7,
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(10),
                                  onPressed: () {
                                    Get.to(EmailLoginPage());
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              14.horizontalSpace,
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black)),
                                  child: CupertinoButton(
                                    padding: EdgeInsets.all(13),
                                    pressedOpacity: 0.7,
                                    color: Colors.transparent,
                                    onPressed: () {
                                      Get.to(SignUpScreen());
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(16),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(MainPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Continue as Guest",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
