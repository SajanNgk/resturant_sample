import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/screens/screens.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  bool _passwordVisible = false;
  bool _obscureText = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.verticalSpacer,
                Center(
                  child: Container(
                      width: 110,
                      child: Image.asset(AppImages.piccadilly.path)),
                ),
                47.h.verticalSpace,
                Text(
                  "Log in ",
                  style: TextStyle(
                    letterSpacing: -1,
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                20.h.verticalSpace,
                FieldName("Phone Number"),
                6.verticalSpacer,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'phone number',
                  ),
                ),
                //   getTextField("helloworld@gmail.com", true, false),
                12.h.verticalSpacer,
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                //  FieldName("Password"),
                6.h.verticalSpace,
                // TextFormField(
                //   obscureText:
                //       !_obscureText,

                //   decoration: InputDecoration(

                //     labelText: 'Password',
                //     hintText: 'Enter your password',
                //     suffixIcon: IconButton(
                //       icon: Icon(
                //         _obscureText ? Icons.visibility : Icons.visibility_off,
                //       ),
                //       onPressed: () {
                //         // Update the state i.e. toogle the state of passwordVisible variable
                //         setState(() {
                //           _obscureText = !_obscureText;
                //         });
                //       },
                //     ),
                //   ),
                // ),
                //  getTextField("my password", false, true),
                8.h.verticalSpace,
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        fontFamily: "Inter",
                      ),
                    )),
                24.h.verticalSpace,
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(MainPage());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                24.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget FieldName(String str) {
    return Text(
      "$str",
      style: TextStyle(
        letterSpacing: 0.5,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget getTextField(String str, bool isSuffix, bool isObsecureText) {
    return Container(
      height: 36.h,
      width: 310.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          )),
      child: CupertinoTextField(
        obscuringCharacter: ".",
        obscureText: isObsecureText,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        placeholder: str,
        suffix: _obscureText
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.check_circle),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.remove_red_eye_outlined),
              ),
        placeholderStyle: TextStyle(
          color: Colors.grey,
          fontFamily: "Inter",
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
