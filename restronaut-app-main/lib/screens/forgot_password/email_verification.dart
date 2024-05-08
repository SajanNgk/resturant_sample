import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/screens/common_widgets/pinfields.dart';
import 'package:hyperce/screens/forgot_password/reset_password.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isButtonEnabled = false;
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
                  145.h.verticalSpacer,
                  Text(
                    'Please check your email',
                    style: TextStyle(fontSize: 30.sp),
                  ),
                  13.verticalSpacer,
                  Text('We’ve sent a code to helloworld@gmail.com'),
                  38.verticalSpacer,
                  PinFields(
                    pinLength: 4,
                    onPinCodeChanged: _updateButtonStatus,
                  ),
                  38.verticalSpacer,
                  Container(
                    width: 353,
                    height: 56,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(ResetPassword());
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
