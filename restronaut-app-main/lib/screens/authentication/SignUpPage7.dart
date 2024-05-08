import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/screens/screens.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class SignUpPage7 extends StatefulWidget {
  const SignUpPage7({super.key});

  @override
  State<SignUpPage7> createState() => _SignUpPage7State();
}

class _SignUpPage7State extends State<SignUpPage7> {
  bool checkBoxValue = false;
  @override
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

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
                32.verticalSpacer,
                Text(
                  "Set Up Your Info",
                  style: TextStyle(
                    letterSpacing: -1,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                20.h.verticalSpace,
                FieldName("first name"),
                6.h.verticalSpacer,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'first name',
                  ),
                ),
                8.verticalSpacer,
                FieldName("Last name"),
                6.h.verticalSpacer,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'last name',
                  ),
                ),
                8.verticalSpacer,
                FieldName("Email"),
                6.h.verticalSpacer,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'zen@gmail.com',
                  ),
                ),
                8.verticalSpacer,
                FieldName("Create a password"),
                6.verticalSpace,
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
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
                8.verticalSpacer,
                FieldName("confirm password"),
                6.verticalSpace,
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    hintText: 'repeat password',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: checkBoxValue,
                      activeColor: Colors.black,
                      onChanged: (bool? value) {
                        setState(() {
                          checkBoxValue = value!;
                        });
                      },
                    ),
                    Text(
                      "I accept the terms and privacy policy",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                20.h.verticalSpace,
                Container(
                  width: 353,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(
                        MainPage(),
                      );
                    },
                    child: Text('Start Ordering'),
                  ),
                ),
                14.h.verticalSpace,
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

  Widget getTextField(String str, bool isSuffix) {
    return Container(
      height: 36.h,
      width: 310.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          )),
      child: CupertinoTextField(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        placeholder: str,
        suffix: isSuffix
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: Icon(Icons.remove_red_eye_outlined),
                  onPressed: () {},
                ))
            : Container(),
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
