import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/authentication/SignUpPage7.dart';

import 'package:hyperce/screens/login_with_phone/widgets/pinfields.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class LoginWithPhone extends StatefulWidget {
  final String phoneNumber;
  const LoginWithPhone({super.key, required this.phoneNumber});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  bool isButtonEnabled = false;
  bool _obscureText = true;
  String? _pinCode;
  void _updateButtonStatus(String pinCode) {
    if (pinCode.length == 6) {
      isButtonEnabled = true;
      _pinCode = pinCode;
    } else {
      isButtonEnabled = false;
      _pinCode = pinCode;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  40.verticalSpacer,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.lineDivider),
                      ),
                      child: Image.asset(AppImages.leftArrow.path),
                    ),
                  ),
                  68.h.verticalSpacer,
                  Text(
                    'Enter Code',
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
                  ),
                  13.verticalSpacer,
                  Text(
                    'We’ve sent an SMS with an activation code to your phone ${widget.phoneNumber}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  38.verticalSpacer,
                  PinFields(
                    pinLength: 5,
                    onPinCodeChanged: _updateButtonStatus,
                  ),
                  38.verticalSpacer,
                  Container(
                    width: 353,
                    height: 56,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(SignUpPage7());
                        },
                        style: ElevatedButton.styleFrom(),
                        child: Text(
                          'Verify',
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  38.verticalSpacer,
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Send code again 00:20',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
