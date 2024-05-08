import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/models/giftModel.dart';
import 'package:hyperce/screens/GiftCartPage.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class GiftPage extends StatefulWidget {
  const GiftPage({super.key});

  @override
  State<GiftPage> createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  GiftModel giftModel = GiftModel(
    imagepath: [
      AppImages.gift1.path,
      AppImages.gift2.path,
      AppImages.gift3.path,
      AppImages.gift4.path,
      AppImages.gift5.path,
      AppImages.gift6.path,
      AppImages.gift7.path,
      AppImages.gift8.path,
    ],
  );
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Text(
                        "Gift",
                        style: GoogleFonts.roboto(
                          fontSize: 21,
                          letterSpacing: 0.6,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.only(
                    // left: 12.0,
                    top: 04,
                  ),
                  child: Text(
                    "1. Please Choose an eGift Card",
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      letterSpacing: 0.1,
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  height: height / 1.89,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2.0,
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing: 14.0, // spacing between rows
                          crossAxisSpacing: 18.0, // spacing between columns
                        ),
                        itemCount: giftModel.imagepath!.length,
                        // padding: EdgeInsets.symmetric(horizontal: 12.0),
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              giftModel.imagepath![index],
                              fit: BoxFit.fill,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                  ),
                ),
                12.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1. Amount",
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    06.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildAmountButton('10'),
                        20.horizontalSpacer,
                        _buildAmountButton('25'),
                        20.horizontalSpacer,
                        _buildAmountButton('30'),
                        20.horizontalSpacer,
                        _buildAmountButton('50'),
                      ],
                    ),
                  ],
                ),
                10.verticalSpace,
                Text(
                  "Other amount",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CupertinoTextField(
                    padding:
                        EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black),
                    ),
                    placeholder: "5 - 10",
                    suffix: Container(
                      child: Center(
                        child: Text(
                          "10",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(04),
                          bottomLeft: Radius.circular(04),
                        ),
                      ),
                      height: 30,
                      width: 70,
                    ),
                  ),
                ),
                10.verticalSpacer,
                Text(
                  "3. Personalize",
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Flexible(
                      child: CupertinoTextField(
                        placeholder: "To (First Name)",
                        padding:
                            EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black),
                          // color: Colors.red,
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    Flexible(
                      child: CupertinoTextField(
                        placeholder: "To (Last Name)",
                        padding:
                            EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black),
                          // color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                CupertinoTextField(
                  placeholder: "Recipient Email",
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black),
                    // color: Colors.red,
                  ),
                ),
                10.verticalSpace,
                CupertinoTextField(
                  placeholder: "Personal Message",
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.black),
                    // color: Colors.red,
                  ),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Flexible(
                      child: CupertinoTextField(
                        placeholder: "Delivery Date",
                        padding:
                            EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black),
                          // color: Colors.red,
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    Flexible(
                      child: CupertinoTextField(
                        placeholder: "Delivery Time",
                        padding:
                            EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black),
                          // color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                10.verticalSpacer,
                Text(
                  "show the date and time only if the send later button is clicker",
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                14.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('Send Later'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(GiftCartPage());
                        },
                        child: Text('Send Now'))
                  ],
                ),
                14.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAmountButton(String amount) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        ),
        onPressed: () {},
        child: Text(amount));
  }

  Widget getBotton(var width, String amount) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(
        horizontal: width / 13,
      ),
      child: Text(amount.toString()),
      pressedOpacity: 0.5,
      onPressed: () {},
      color: Color.fromARGB(255, 212, 82, 49),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
