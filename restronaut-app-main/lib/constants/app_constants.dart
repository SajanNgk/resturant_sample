import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color yellow = Color(0xffFDC054);
const Color mediumYellow = Color(0xffFDB846);
const Color darkYellow = Color(0xffE99E22);
const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
const Color darkGrey = Color(0xff202020);

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}

const Color kUltraViolet66 = Color(0xff666592);
const Color kLightUltraVioletAA = Color(0xffAAA9C9);
const Color kYellowXanthousFF = Color(0xffFFC154);
const Color kGreenEmerald3D = Color(0xff3DC26F);
const Color kLightGreenNyanzaE5 = Color(0xffE5FFDF);

const Color kWhite = Color(0xffffffff);
const Color kGrey = Color(0xffECECEC);

const double kBorderRadius10 = 10.0;
const double kBorderRadius12 = 12.0;

const double kPadding4 = 4.0;
const double kPadding6 = 6.0;
const double kPadding8 = 8.0;
const double kPadding12 = 12.0;
const double kPadding16 = 16.0;
const double kPadding18 = 18.0;
const double kPadding20 = 20.0;
const double kPadding24 = 24.0;

final kWorkSansBold = GoogleFonts.workSans(
  fontWeight: FontWeight.w700,
);

final kWorkSansSemibold = GoogleFonts.workSans(
  fontWeight: FontWeight.w600,
);

final kWorkSansMedium = GoogleFonts.workSans(
  fontWeight: FontWeight.w500,
);

final kWorkSansRegular = GoogleFonts.workSans(
  fontWeight: FontWeight.w400,
);
