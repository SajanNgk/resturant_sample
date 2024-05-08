import 'package:flutter/material.dart';
import 'package:hyperce/constants/app_colors.dart';

class RestronautAppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: 'Inter',
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.mainColor; // Grey background when selected
          } else {
            return Colors.white; // White background when not selected
          }
        }),
        checkColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white; // White checkmark when selected
          } else {
            return Colors.black; // Black checkmark when not selected
          }
        }),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          backgroundColor: const Color(0xffAC4F35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        disabledColor: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(color: AppColors.lineDivider),
        ),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
      ),
      cardTheme: const CardTheme(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.containerBorderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        elevation: 0,
        margin: EdgeInsets.all(0),
      ),
    );
  }
}
