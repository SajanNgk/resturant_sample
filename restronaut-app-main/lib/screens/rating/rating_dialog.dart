import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/screens/widgets/our_flutter_toast.dart';
import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/our_product_model.dart';
import '../../constants/app_colors.dart';

class RatingDialog extends StatefulWidget {
  final OurProductModel model;

  const RatingDialog({super.key, required this.model});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double rateValue = 0.0;
  TextEditingController _rating_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Widget payNow = InkWell(
      onTap: () async {
        print(widget.model.productVariantDetail![0].slug);
        print(widget.model.productVariantDetail![0].productId);
        if (_rating_controller.text.trim().isNotEmpty) {
          GraphQLService().submitReview(int.parse(widget.model.productId ?? ""),
              rateValue, _rating_controller.text.trim(), context);
          // GraphQLService().getReviewDetail(
          // int.parse(widget.model.productId ?? ""),
          // widget.model.productVariantDetail![0].slug!,
          //     context);
        } else {
          OurToast().showErrorToast("Field can't be empty");
        }

        // Navigator.of(context).pop();
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (_) => CheckOutPage()));
      },
      child: Container(
        height: ScreenUtil().setSp(45),
        width: width / 1.5,
        decoration: BoxDecoration(
            // gradient: mainButton,
            color: darkLogoColor,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: ScreenUtil().setSp(10),
              )
            ],
            borderRadius: BorderRadius.circular(ScreenUtil().setSp(9))),
        child: Center(
          child: Text(
            "Rate Now",
            style: TextStyle(
              color: const Color(0xfffefefe),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil().setSp(20),
            ),
          ),
        ),
      ),
    );

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                ScreenUtil().setSp(10),
              ),
            ),
            color: Colors.grey[50]),
        padding: EdgeInsets.all(
          ScreenUtil().setSp(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Thank You!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            OurSizedBox(),
            RichText(
              text: TextSpan(
                  style:
                      TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                  children: [
                    TextSpan(
                      text: widget.model.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    )
                  ]),
            ),
            OurSizedBox(),
            RatingStars(
              value: rateValue,
              onValueChanged: (value) {
                setState(() {
                  rateValue = value;
                });
              },
              starBuilder: (index, color) => Icon(
                Icons.favorite,
                color: color,
                size: ScreenUtil().setSp(25),
              ),
              starCount: 5,
              starSize: ScreenUtil().setSp(25),
              valueLabelColor: const Color(0xff9b9b9b),
              valueLabelTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(12),
              ),
              valueLabelRadius: ScreenUtil().setSp(20),
              maxValue: 5,
              starSpacing: 1,
              maxValueVisibility: true,
              valueLabelVisibility: true,
              animationDuration: const Duration(milliseconds: 800),
              valueLabelPadding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setSp(2),
                horizontal: ScreenUtil().setSp(2),
              ),
              valueLabelMargin: EdgeInsets.only(
                right: ScreenUtil().setSp(3),
              ),
              starOffColor: Colors.grey.shade300,
              starColor: darkgoldenLogoColor,
            ),
            // RatingBar(
            //   itemSize: ScreenUtil().setSp(30),
            //   allowHalfRating: false,
            //   initialRating: 0,
            //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            //   onRatingUpdate: (value) {
            //     setState(() {
            //       rateValue = value;
            //     });
            //   },
            //   ratingWidget: RatingWidget(
            //     empty: Icon(
            //       Icons.favorite_border,
            //       color: Color(0xffFF8993),
            //       size: ScreenUtil().setSp(30),
            //     ),
            //     full: Icon(
            //       Icons.favorite,
            //       color: Color(0xffFF8993),
            //       size: ScreenUtil().setSp(30),
            //     ),
            //     half: Icon(
            //       Icons.favorite_border,
            //       color: Color(0xffFF8993),
            //       size: ScreenUtil().setSp(30),
            //     ),
            //   ),
            // ),
            OurSizedBox(),
            Container(
              margin: EdgeInsets.symmetric(
                  // horizontal: ScreenUtil().setSp(2.5),
                  // vertical: ScreenUtil().setSp(2.5),
                  ),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setSp(7.5),
                vertical: ScreenUtil().setSp(7.5),
              ),
              // padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: TextField(
                controller: _rating_controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Say something about the product.'),
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(12.5),
                  color: Colors.grey[600],
                ),
                maxLength: 200,
              ),
            ),
            OurSizedBox(),
            payNow
          ],
        ),
      ),
    );
  }
}
