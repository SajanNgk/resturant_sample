import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/api/api.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/authentication/login_screen.dart';

class OTPScreen extends StatelessWidget {
  final String? email;
  final GraphQLService gq = GraphQLService();

  OTPScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkLogoColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.9 -
                    kBottomNavigationBarHeight * 0.95,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setSp(12.5),
                  vertical: ScreenUtil().setSp(12.5),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      ScreenUtil().setSp(45),
                    ),
                    topRight: Radius.circular(
                      ScreenUtil().setSp(45),
                    ),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'OTP Verification',
                        style: TextStyle(
                          color: darkLogoColor,
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setSp(10),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setSp(20),
                        ),
                        child: Image.asset(
                          'assets/logo.png',
                          height: ScreenUtil().setSp(125),
                          width: ScreenUtil().setSp(125),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Verification token has been sent to your email, please verify',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: darkLogoColor,
                        ),
                      ),

                      // Log In Button with Underline Text Button
                      SizedBox(
                        height: ScreenUtil().setSp(15),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the login screen when the "Log In" button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: darkgoldenLogoColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
