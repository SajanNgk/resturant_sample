import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/screens/authentication/EmailLoginPage.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isPasswordChanged = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: isPasswordChanged
                ? _buildResetPasswordFields()
                : _buildPasswordChanged()),
      ),
    );
  }

  Widget _buildPasswordChanged() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          225.verticalSpacer,
          Image.asset(AppImages.stars.path),
          36.h.verticalSpacer,
          Text(
            'Password changed',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          13.verticalSpacer,
          Text(
            'Your password has been changed succesfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          39.h.verticalSpacer,
          Container(
            width: 353,
            height: 56,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(EmailLoginPage());
                },
                style: ElevatedButton.styleFrom(),
                child: Text(
                  'Back to Login',
                  style: TextStyle(fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildResetPasswordFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        145.h.verticalSpacer,
        Text(
          'Reset Password',
          style: TextStyle(fontSize: 30),
        ),
        13.verticalSpacer,
        Text(
          'Please type something you\’ll remember',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        38.verticalSpacer,
        Text(
          "New password",
          style: TextStyle(fontSize: 14.sp),
        ),
        6.verticalSpacer,
        TextFormField(
          decoration: InputDecoration(
            hintText: 'must be 8 characters',
          ),
        ),
        38.verticalSpacer,
        Text(
          "Confirm new password",
          style: TextStyle(fontSize: 14.sp),
        ),
        6.verticalSpacer,
        TextFormField(
          decoration: InputDecoration(
            hintText: 'repeat password',
          ),
        ),
        39.verticalSpacer,
        Container(
          width: 353,
          height: 56,
          child: ElevatedButton(
              onPressed: () {
                // Get.to(ResetPassword());
              },
              style: ElevatedButton.styleFrom(),
              child: Text(
                'Reset Password',
                style: TextStyle(fontSize: 16),
              )),
        ),
      ],
    );
  }
}
