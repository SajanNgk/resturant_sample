import 'package:flutter/material.dart';

extension NumX on num {
  Widget get verticalSpacer => SizedBox(height: toDouble());
  Widget get horizontalSpacer => SizedBox(width: toDouble());
}
