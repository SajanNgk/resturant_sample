import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LeftBackground extends CustomPainter {
  LeftBackground();

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;
    canvas.drawRect(
      Rect.fromLTRB(0, 0, width, height),
      Paint()..color = Colors.white,
    );
    canvas.drawRect(
      Rect.fromLTRB(0, 0, width / 3, height),
      Paint()..color = darkgoldenLogoColor.withOpacity(0.75),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
