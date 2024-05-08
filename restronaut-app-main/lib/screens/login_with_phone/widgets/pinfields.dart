import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinFields extends StatefulWidget {
  final Function(String) onPinCodeChanged;
  final int pinLength;

  const PinFields(
      {super.key, required this.onPinCodeChanged, this.pinLength = 6});

  @override
  State<PinFields> createState() => _PinFieldsState();
}

class _PinFieldsState extends State<PinFields> {
  TextEditingController transactionpinEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: PinCodeTextField(
        length: widget.pinLength,
        animationType: AnimationType.fade,
        autoDismissKeyboard: true,
        autoFocus: true,
        enablePinAutofill: false,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        pinTheme: _getPinTheme(),
        animationDuration: const Duration(milliseconds: 300),
        controller: transactionpinEditingController,
        onChanged: (value) {
          widget.onPinCodeChanged(value);
        },
        beforeTextPaste: (text) {
          debugPrint('Allowing to paste $text');
          return true;
        },
        appContext: context,
      ),
    );
  }

  PinTheme _getPinTheme() {
    return PinTheme(
        shape: PinCodeFieldShape.box,
        borderWidth: 2,
        borderRadius: BorderRadius.circular(10.r),
        selectedColor: Colors.green,
        activeColor: Colors.green,
        inactiveColor: Colors.grey,
        fieldHeight: 64.h,
        fieldWidth: 54.w);
  }
}
