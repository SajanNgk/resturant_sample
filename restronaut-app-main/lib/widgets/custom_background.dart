import 'package:flutter/material.dart';

import 'package:hyperce/constants/app_colors.dart';

class MainBackground extends CustomPainter {
  MainBackground();

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    // Paint the entire canvas with a white background
    canvas.drawRect(
        Rect.fromLTRB(0, 0, width, height), Paint()..color = Colors.white);

    // Draw a colored rectangle on the right side (adjust the width as needed)
    double coloredRectWidth = width / 3;
    canvas.drawRect(
      Rect.fromLTRB(width - coloredRectWidth, 0, width, height),
      Paint()..color = darkLogoColor.withOpacity(0.75),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
