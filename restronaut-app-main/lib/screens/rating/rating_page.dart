import 'package:cached_network_image/cached_network_image.dart';
import 'package:hyperce/models/our_product_model.dart';
import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/screens/widgets/our_spinner.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:hyperce/screens/rating/rating_dialog.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/rating_controller.dart';
import '../../models/rating_detail_model.dart';
import '../../constants/app_colors.dart';

class RatingPage extends StatefulWidget {
  final OurProductModel ourProductModel;

  const RatingPage({super.key, required this.ourProductModel});
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0.0;
  List<int> ratings = [2, 1, 5, 2, 4, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: ScreenUtil().setSp(35),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/icons/comment.png'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: RatingDialog(
                        model: widget.ourProductModel,
                      ),
                    );
                  },
                );
              },
              color: Colors.black,
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(7.5),
              vertical: ScreenUtil().setSp(7.5),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(65),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            widget.ourProductModel.productAssets![0] ?? "",
                        // Image.network(
                        placeholder: (context, url) => Image.asset(
                          "assets/profile_holder.png",
                        ),
                        height: ScreenUtil().setSp(150),
                        width: ScreenUtil().setSp(150),
                        fit: BoxFit.fitWidth,
                        //   )
                      ),
                    ),
                  ),
                  OurSizedBox(),
                  OurSizedBox(),
                  OurSizedBox(),
                  Text(
                    widget.ourProductModel.productName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkLogoColor,
                      fontSize: ScreenUtil().setSp(25),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  OurSizedBox(),
                  Divider(
                    color: darkLogoColor,
                  ),
                  OurSizedBox(),
                  OurSizedBox(),

                  StreamBuilder(
                      stream: RatingItemController.getData(
                        int.parse(widget.ourProductModel.productId ?? ""),
                        widget.ourProductModel.productVariantDetail![0].slug!,
                      ),
                      builder: (BuildContext context,
                          AsyncSnapshot<RatingDetailModel?> snapshot) {
                        if (snapshot.hasData) {
                          RatingDetailModel ratingDetailModel = snapshot.data!;
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    // " ${ratingDetailModel.customFields!.reviewRating.toString(). ?? 0.0}",
                                    ratingDetailModel
                                                .customFields!.reviewRating !=
                                            null
                                        ? ratingDetailModel
                                            .customFields!.reviewRating!
                                            .toStringAsFixed(2)
                                            .toString()
                                        : "0.0",
                                    style: TextStyle(
                                      color: darkLogoColor,
                                      fontSize: ScreenUtil().setSp(35),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: ScreenUtil().setSp(20),
                                  ),
                                  Column(
                                    children: [
                                      RatingStars(
                                        value: double.parse(ratingDetailModel
                                                .customFields!.reviewRating
                                                .toString()) ??
                                            0.0,
                                        starBuilder: (index, color) => Icon(
                                          Icons.favorite,
                                          color: color,
                                          size: ScreenUtil().setSp(25),
                                        ),
                                        starCount: 5,
                                        starSize: ScreenUtil().setSp(25),
                                        valueLabelColor:
                                            const Color(0xff9b9b9b),
                                        valueLabelTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: ScreenUtil().setSp(12),
                                        ),
                                        valueLabelRadius:
                                            ScreenUtil().setSp(20),
                                        maxValue: 5,
                                        starSpacing: ScreenUtil().setSp(5),
                                        maxValueVisibility: true,
                                        valueLabelVisibility: true,
                                        animationDuration:
                                            const Duration(milliseconds: 800),
                                        valueLabelPadding: EdgeInsets.symmetric(
                                          vertical: ScreenUtil().setSp(4.2),
                                          horizontal: ScreenUtil().setSp(4.2),
                                        ),
                                        valueLabelMargin: EdgeInsets.only(
                                          right: ScreenUtil().setSp(3),
                                        ),
                                        starOffColor: Colors.grey.shade300,
                                        starColor: darkgoldenLogoColor,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          'From ${ratingDetailModel.customFields!.reviewCount} people',
                                          style: TextStyle(
                                            color: darkLogoColor,
                                            fontSize: ScreenUtil().setSp(17.5),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              ratingDetailModel.reviews!.items!.length != 0
                                  ? Column(
                                      children: [
                                        OurSizedBox(),
                                        Align(
                                          alignment: Alignment(-1, 0),
                                          child: Text(
                                            'Recent Reviews',
                                            style: TextStyle(
                                              color: darkLogoColor,
                                              fontSize:
                                                  ScreenUtil().setSp(17.5),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        OurSizedBox(),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            reverse: true,
                                            itemCount: ratingDetailModel
                                                .reviews!.items!.length,
                                            itemBuilder: (context, index) {
                                              Items item = ratingDetailModel
                                                  .reviews!.items![index];
                                              return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4.0),
                                                padding: EdgeInsets.all(
                                                  ScreenUtil().setSp(5),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                      ScreenUtil().setSp(5),
                                                    ),
                                                  ),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 16.0),
                                                      child: CircleAvatar(
                                                        maxRadius: 14,
                                                        backgroundImage: AssetImage(
                                                            'assets/background.jpg'),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          OurSizedBox(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Text(
                                                                item.authorName ??
                                                                    "",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              14.5),
                                                                  color:
                                                                      darkLogoColor,
                                                                ),
                                                              ),
                                                              Text(
                                                                timeago.format(
                                                                    DateTime.parse(
                                                                        item.updatedAt ??
                                                                            "")),
                                                                style: TextStyle(
                                                                    color:
                                                                        darkLogoColor,
                                                                    fontSize:
                                                                        10.0),
                                                              )
                                                            ],
                                                          ),
                                                          OurSizedBox(),
                                                          RatingStars(
                                                            value: double.parse(
                                                              item.rating
                                                                  .toString(),
                                                            ),
                                                            starBuilder: (index,
                                                                    color) =>
                                                                Icon(
                                                              Icons.favorite,
                                                              color: color,
                                                              size: ScreenUtil()
                                                                  .setSp(17),
                                                            ),
                                                            starCount: 5,
                                                            starSize:
                                                                ScreenUtil()
                                                                    .setSp(15),
                                                            valueLabelColor:
                                                                const Color(
                                                                    0xff9b9b9b),
                                                            valueLabelTextStyle:
                                                                TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          12),
                                                            ),
                                                            valueLabelRadius:
                                                                ScreenUtil()
                                                                    .setSp(20),
                                                            maxValue: 5,
                                                            starSpacing: 1,
                                                            maxValueVisibility:
                                                                true,
                                                            valueLabelVisibility:
                                                                false,
                                                            animationDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        800),
                                                            valueLabelPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                              vertical:
                                                                  ScreenUtil()
                                                                      .setSp(2),
                                                              horizontal:
                                                                  ScreenUtil()
                                                                      .setSp(2),
                                                            ),
                                                            valueLabelMargin:
                                                                EdgeInsets.only(
                                                              right:
                                                                  ScreenUtil()
                                                                      .setSp(3),
                                                            ),
                                                            starOffColor: Colors
                                                                .grey.shade300,
                                                            starColor:
                                                                darkgoldenLogoColor,
                                                          ),
                                                          OurSizedBox(),
                                                          Text(
                                                            item.body ?? "",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          14.5),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                          OurSizedBox(),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        ),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            ScreenUtil().setSp(25),
                                          ),
                                          child: Image.asset(
                                            'assets/logo.png',
                                            height: ScreenUtil().setSp(175),
                                            width: ScreenUtil().setSp(175),
                                          ),
                                        ),
                                        OurSizedBox(),
                                        OurSizedBox(),
                                        Text(
                                          "No reviews",
                                          style: TextStyle(
                                            color: darkLogoColor,
                                            fontSize: ScreenUtil().setSp(22.5),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return OurSpinner();
                        } else {
                          return Icon(
                            Icons.favorite_outline,
                            color: darkgoldenLogoColor,
                            size: ScreenUtil().setSp(22.5),
                          );
                        }
                      }),
                  OurSizedBox(),
                  OurSizedBox(),
                  OurSizedBox(),

                  // Column(
                  //   children: <Widget>[
                  //     ...ratings
                  //         .map((val) => Container(
                  //             margin: const EdgeInsets.symmetric(vertical: 4.0),
                  //             padding: const EdgeInsets.all(8.0),
                  //             decoration: BoxDecoration(
                  //                 color: Colors.white,
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(5.0))),
                  //             child: Row(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: <Widget>[
                  //                 Padding(
                  //                   padding: const EdgeInsets.only(right: 16.0),
                  //                   child: CircleAvatar(
                  //                     maxRadius: 14,
                  //                     backgroundImage:
                  //                         AssetImage('assets/background.jpg'),
                  //                   ),
                  //                 ),
                  //                 Expanded(
                  //                   child: Column(
                  //                     mainAxisSize: MainAxisSize.min,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: <Widget>[
                  //                       Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.spaceBetween,
                  //                         children: <Widget>[
                  //                           Text(
                  //                             'Billy Holand',
                  //                             style: TextStyle(
                  //                                 fontWeight: FontWeight.bold),
                  //                           ),
                  //                           Text(
                  //                             '10 am, Via iOS',
                  //                             style: TextStyle(
                  //                                 color: Colors.grey,
                  //                                 fontSize: 10.0),
                  //                           )
                  //                         ],
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.symmetric(
                  //                             vertical: 8.0),
                  //                         child: RatingBar(
                  //                           ignoreGestures: true,
                  //                           itemSize: 20,
                  //                           allowHalfRating: true,
                  //                           initialRating: val.toDouble(),
                  //                           itemPadding: EdgeInsets.symmetric(
                  //                               horizontal: 4.0),
                  //                           ratingWidget: RatingWidget(
                  //                             empty: Icon(Icons.favorite_border,
                  //                                 color: Color(0xffFF8993),
                  //                                 size: 20),
                  //                             full: Icon(
                  //                               Icons.favorite,
                  //                               color: Color(0xffFF8993),
                  //                               size: 20,
                  //                             ),
                  //                             half: SizedBox(),
                  //                           ),
                  //                           onRatingUpdate: (value) {
                  //                             setState(() {
                  //                               rating = value;
                  //                             });
                  //                             print(value);
                  //                           },
                  //                         ),
                  //                       ),
                  //                       Text(
                  //                         'Not as I expected! ... I`m really sad',
                  //                         style: TextStyle(
                  //                           color: Colors.grey,
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.symmetric(
                  //                             vertical: 16.0),
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.spaceBetween,
                  //                           children: <Widget>[
                  //                             Text(
                  //                               '21 likes',
                  //                               style: TextStyle(
                  //                                   color: Colors.grey[400],
                  //                                   fontSize: 10.0),
                  //                             ),
                  //                             Text(
                  //                               '1 Comment',
                  //                               style: TextStyle(
                  //                                   color: Colors.blue,
                  //                                   fontWeight: FontWeight.bold,
                  //                                   fontSize: 10.0),
                  //                             )
                  //                           ],
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 )
                  //               ],
                  //             )))
                  //         .toList()
                  // ],
                  // )
                ],
              ),
            ),
          ),
        ));
  }
}
