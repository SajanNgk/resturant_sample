import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class GiftCartPage extends StatefulWidget {
  const GiftCartPage({super.key});

  @override
  State<GiftCartPage> createState() => _GiftCartPageState();
}

class _GiftCartPageState extends State<GiftCartPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Flexible(
                flex: 09,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Your Cart
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "Your Cart",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 19,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    14.verticalSpace,
                    //Image
                    Center(
                      child: Image.asset(AppImages.cartimage.path),
                    ),
                    12.verticalSpace,
                    //To Zenos
                    rowWidget("To", "Zenos"),
                    8.verticalSpace,
                    //From Zenos
                    rowWidget("From", "Zen sama"),
                    8.verticalSpace,
                    //eGift Card
                    rowWidget("Card Type", "eGift Card"),
                    8.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Message
                        Text(
                          "Message:",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        9.horizontalSpacer,
                        Flexible(
                          child: Text(
                            "This is the message that you want to convey to your individual person.",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        6.horizontalSpace,
                      ],
                    ),
                    16.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(08),
                                  border: Border.all(color: Colors.black)),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 4),
                                pressedOpacity: 0.5,
                                onPressed: () {},
                                child: Text(
                                  "Edit",
                                  style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          14.horizontalSpace,
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(08),
                                  border: Border.all(color: Colors.black)),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 14),
                                pressedOpacity: 0.5,
                                color: Colors.transparent,
                                onPressed: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return GiftPage();
                                  // }));
                                },
                                child: Text(
                                  "Remove",
                                  style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    color: AppColors.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: CupertinoButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 3.3, vertical: 1),
                    pressedOpacity: 0.5,
                    onPressed: () {},
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10),
                    child: Text(
                      "Checkout",
                      style: GoogleFonts.roboto(
                        letterSpacing: 1,
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget rowWidget(String s1, String s2) {
  return Row(
    children: [
      Text(
        "$s1:",
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      6.horizontalSpace,
      Text(
        "$s2",
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ],
  );
}
