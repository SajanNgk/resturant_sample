import 'package:get/get.dart';
import 'package:hyperce/api/api.dart';
import 'package:hyperce/constants/constants.dart';
import 'package:hyperce/models/createcustomer.dart';
import 'package:hyperce/models/createcustomerreuslt.dart';
import 'package:hyperce/models/loging.dart';
import 'package:hyperce/models/model.dart';
import 'package:hyperce/screens/authentication/EmailLoginPage.dart';
import 'package:hyperce/screens/authentication/SignUpPage7.dart';
import 'package:hyperce/screens/authentication/otp_screen.dart';
import 'package:hyperce/screens/forgot_password/forgot_password.dart';
import 'package:hyperce/screens/login_with_phone/login_with_phone.dart';
import 'package:hyperce/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/screens/widgets/our_flutter_toast.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email_controller = TextEditingController();

  TextEditingController _password_controller = TextEditingController();
  TextEditingController _first_controller = TextEditingController();
  TextEditingController _last_controller = TextEditingController();
  TextEditingController _phone_controller = TextEditingController();
  GraphQLService gp = GraphQLService();

// metthod to make function more easy

  Future<void> signUp() async {
    try {
      final input = CreateCustomerInput(
        firstName: _first_controller.text,
        lastName: _last_controller.text,
        phoneNumber: _phone_controller.text,
        emailAddress: _email_controller.text,
        password: _password_controller.text,
      );

      final result = await gp.registerCustomerAccount(input);

      if (result is SuccessResult) {
        print('otp page');
        await Get.to(OTPScreen());
      } else if (result is MissingPasswordErrorResult) {
        print("Missing password");
        OurToast().showErrorToast("Missing password");
      } else if (result is PasswordValidationErrorResult) {
        OurToast().showErrorToast("PassordValidatationError");
      } else if (result is NativeAuthStrategyErrorResult) {
        OurToast().showErrorToast("NativeAuthStrategyErrorResult");
      }
    } catch (e) {
      // Handle any exceptions here
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("height is" + size.height.toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 55.0),
              child: Column(
                children: [
                  Text(
                    "Please confirm your country code and enter your phone number.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  12.h.verticalSpacer,
                  IntlPhoneField(
                    controller: _phone_controller,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Phone Number',
                    ),
                    initialCountryCode: 'US',
                    onChanged: (phone) {
                      // print(phone.completeNumber);
                    },
                  ),
                  12.h.verticalSpacer,
                  Container(
                    height: 45.h,
                    width: 310.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(LoginWithPhone(
                          phoneNumber: _phone_controller.text,
                        ));
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // 14.h.verticalSpacer,
                  14.h.verticalSpace,
                  // Row(children: [
                  //   Expanded(
                  //     child: Divider(
                  //       thickness: 1.5,
                  //       // height: 2,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  //   10.h.horizontalSpacer,
                  //   Text("Or sign in with"),
                  //   10.h.horizontalSpacer,
                  //   Expanded(
                  //     child: Divider(
                  //       thickness: 1.5,
                  //       // height: 2,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ]),
                  // 14.h.verticalSpacer,
                  // getContainer(AppImages.googleIcon.path, "Google"),
                  // 14.h.verticalSpacer,
                  // getContainer(AppImages.appleIcon.path, "Apple"),
                  // 14.h.verticalSpacer,
                  // getContainer(AppImages.mailIcon.path, "Email"),
                  // 20.h.verticalSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Text(
                          'Continue as Guest',
                        ),
                        onTap: () {
                          Get.to(MainPage());
                        },
                      ),
                    ],
                  ),
                  20.verticalSpacer,
                  InkWell(
                      onTap: () {
                        Get.to((EmailLoginPage()));
                      },
                      child: Text(
                        'Login',
                      )),
                  20.verticalSpacer,
                  InkWell(
                      onTap: () {
                        Get.to(ForgotPassword());
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: AppColors.mainColor),
                      )),
                  87.verticalSpacer,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getContainer(String appIcon, String str) {
    return Container(
      height: 45.h,
      width: 310.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(08),
          border: Border.all(
            color: Colors.black,
          )),
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(appIcon),
            16.horizontalSpace,
            Text(
              'Continue with $str',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
