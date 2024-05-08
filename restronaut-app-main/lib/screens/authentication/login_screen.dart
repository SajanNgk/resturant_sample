import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/controllers/progress_controller.dart';
import 'package:hyperce/screens/authentication/sign_up_screen.dart';
import 'package:hyperce/screens/widgets/our_elevated_button.dart';
import 'package:hyperce/screens/widgets/our_flutter_toast.dart';
import 'package:hyperce/screens/widgets/our_password_field.dart';
import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/screens/widgets/our_text_field.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';

import '../widgets/our_spinner.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.find<ProgressController>().changeValue(false);
    final size = MediaQuery.of(context).size;
    return Obx(() => ModalProgressHUD(
        inAsyncCall: Get.find<ProgressController>().progress.value,
        progressIndicator: OurSpinner(),
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: darkLogoColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //to give space from top
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),

                  //page content here
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //header text
                        Text(
                          'Login Account',
                          style: TextStyle(
                            color: darkLogoColor,
                            fontSize: ScreenUtil().setSp(30),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setSp(7.5),
                        ),
                        // Color(0xFF969AA8)
                        Text(
                          'Discover best products & Try to Login',
                          style: TextStyle(
                            color: Color(0xFF969AA8),
                            fontSize: ScreenUtil().setSp(12.5),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: ScreenUtil().setSp(30),
                        ),

                        //logo section
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setSp(20),
                          ),
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: ScreenUtil().setSp(125),
                            width: ScreenUtil().setSp(125),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(20),
                              color: darkLogoColor,
                              letterSpacing: 2.000000061035156,
                            ),
                            children: const [
                              TextSpan(
                                text: 'LOGIN',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: ' PAGE',
                                style: TextStyle(
                                  color: darkgoldenLogoColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setSp(30),
                        ),

                        //email & password section
                        CustomTextField(
                          icon: Icons.email,
                          controller: _email_controller,
                          validator: (value) {},
                          title: "Email",
                          type: TextInputType.emailAddress,
                          number: 1,
                        ),
                        OurSizedBox(),
                        PasswordForm(
                          controller: _password_controller,
                          title: "Password",
                          validator: (value) {},
                          number: 1,
                        ),
                        OurSizedBox(),

                        //sign in button
                        OurElevatedButton(
                          title: "Login",
                          function: () async {
                            if (!_email_controller.text.trim().contains("@")) {
                              OurToast().showErrorToast(
                                  "Email address badly formatted");
                            } else if (_email_controller.text.trim().isEmpty ||
                                _password_controller.text.trim().isEmpty) {
                              OurToast()
                                  .showErrorToast("Fields cannot be empty");
                            } else {
                              // In LoginScreen
                              print(
                                  "Loading state: ${Get.find<ProgressController>().progress.value}");

                              try {
                                // Get.find<ProgressController>()
                                //     .changeValue(true); // Start progress
                                await GraphQLService().userlogin(
                                  _email_controller.text.trim(),
                                  _password_controller.text.trim(),
                                  context,
                                );
                                // // Stop progress on success
                                // Get.find<ProgressController>()
                                //     .changeValue(false);
                              } catch (e) {
                                // // Handle errors here and stop progress
                                // Get.find<ProgressController>()
                                //     .changeValue(false);
                              }
                            }
                          },
                          color: darkLogoColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(5),
              vertical: ScreenUtil().setSp(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account ? ',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.5),
                      color: darkLogoColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: SignUpScreen(),
                          type: PageTransitionType.leftToRight,
                        ),
                      );
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFFFF5844),
                        fontSize: ScreenUtil().setSp(17.5),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }

  @override
  void dispose() {
    _email_controller.dispose();
    _password_controller.dispose();
    super.dispose();
  }
}
