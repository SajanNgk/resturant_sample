import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class RestronauTextField extends StatelessWidget {
  final String hintText;
  final Widget? sufixIcon;
  final IconData? prefixIcon;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final bool obscureText;
  final bool isReadOnly;
  final Function? btnUpdateStatus;
  final InputDecoration? decoration;
  final int? maxLength;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function(String)? onChanged;
  final double height;
  final double width;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixText;
  final bool isPrefixIcon;

  final double horizontalTextFieldContentPadding;

  final double verticalTextFieldContentPadding;

  const RestronauTextField({
    super.key,
    required this.hintText,
    this.decoration,
    this.maxLength,
    this.btnUpdateStatus,
    this.obscureText = false,
    this.sufixIcon,
    this.prefixIcon,
    this.prefixText,
    this.textEditingController,
    this.textInputType = TextInputType.text,
    this.isReadOnly = false,
    this.onChanged,
    required this.height,
    required this.width,
    this.contentPadding = EdgeInsets.zero,
    this.fontSize = 15.0,
    this.fontWeight = FontWeight.w400,
    this.verticalTextFieldContentPadding = 10.0,
    this.horizontalTextFieldContentPadding = 10.0,
    this.isPrefixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60.0),
      ),
      alignment: Alignment.center,
      child: TextField(
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          contentPadding: const EdgeInsets.all(10),
          fillColor: Colors.black,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            fontSize: fontSize,
            color: Colors.black,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
