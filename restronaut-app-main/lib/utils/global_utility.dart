import 'package:flutter/material.dart';

class Utility {
  static void navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
