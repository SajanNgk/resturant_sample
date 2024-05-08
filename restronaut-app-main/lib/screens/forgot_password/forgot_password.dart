import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/screens/forgot_password/email_verification.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                145.h.verticalSpacer,
                Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 30.sp),
                ),
                13.verticalSpacer,
                Text(
                  'Don’t worry! It happens. Please enter the email associated with your account.',
                  style: TextStyle(fontSize: 16.sp),
                ),
                38.verticalSpacer,
                Text(
                  "Email address",
                  style: TextStyle(fontSize: 14),
                ),
                6.verticalSpacer,
                TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Enter your email address'),
                ),
                39.verticalSpacer,
                Container(
                  width: 353,
                  height: 56,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(EmailVerification());
                      },
                      style: ElevatedButton.styleFrom(),
                      child: Text(
                        'send code',
                        style: TextStyle(fontSize: 16),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
