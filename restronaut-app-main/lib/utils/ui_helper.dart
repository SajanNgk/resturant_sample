import 'package:flutter/material.dart';

class UiHelper {
  static Widget horizontalDivider(
      {required Color color,
      required double thickness,
      required int endIndent}) {
    return Divider(
      color: color,
      thickness: thickness,
    );
  }
}
