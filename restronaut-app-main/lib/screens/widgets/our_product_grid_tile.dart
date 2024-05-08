import 'package:cached_network_image/cached_network_image.dart';
import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/models/our_product_model.dart';
import 'package:hyperce/screens/product/product_detail_view_screen.dart';
import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hive/hive.dart';
import '../../controllers/favourite_item_controller.dart';
import '../../controllers/rating_controller.dart';
import '../../api/db/db_helper.dart';

import '../../controllers/product_varient_controller.dart';
import '../../models/rating_detail_model.dart';
import 'our_flutter_toast.dart';

class OurProductGridTile extends StatefulWidget {
  const OurProductGridTile({super.key, required this.ourProductModel});
  final OurProductModel ourProductModel;
  @override
  State<OurProductGridTile> createState() => _OurProductGridTileState();
}

class _OurProductGridTileState extends State<OurProductGridTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<ProductVarientController>().resetVarientIndex();
        FocusScope.of(context).unfocus();

        Navigator.push(
            context,
            PageTransition(
                child: OurProductDetailViewScreen(
                    ourProductModel: widget.ourProductModel),
                type: PageTransitionType.leftToRight));

        // print(widget.ourProductModel.productAssets);
        // widget.ourProductModel.productAssets!
        //     .toSet()
        //     .toList()
        //     .forEach((element) {
        //   print(element);
        // });
        // widget.ourProductModel.productVariantDetail!.forEach((element) {
        //   print(element);
        // });
        // print(widget.ourProductModel.toJson());
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.475,
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setSp(2),
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300.withOpacity(0.4),
          borderRadius: BorderRadius.circular(
            ScreenUtil().setSp(15),
          ),
        ),
        padding: EdgeInsets.only(
          left: ScreenUtil().setSp(5),
          right: ScreenUtil().setSp(5),
          bottom: ScreenUtil().setSp(2.5),
          top: ScreenUtil().setSp(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                Material(
                  type: MaterialType.transparency,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        ScreenUtil().setSp(10),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.ourProductModel.productAssets![0] ?? "",
                      // Image.network(
                      placeholder: (context, url) => Image.asset(
                        "assets/profile_holder.png",
                      ),
                      height: ScreenUtil().setSp(165),
                      width: ScreenUtil().setSp(165),
                      fit: BoxFit.cover,
                      //   )
                    ),
                  ),
                ),
                Positioned(
                    right: ScreenUtil().setSp(7.5),
                    top: ScreenUtil().setSp(7.5),
                    child: Material(
                      type: MaterialType.transparency,
                      child: StreamBuilder(
                          stream: FavoriteItemController.getData(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<String>?> snapshot) {
                            if (snapshot.hasData) {
                              List<String> favoriteList = snapshot.data!;
                              return InkWell(
                                onTap: () async {
                                  String token = Hive.box<String>(
                                          DatabaseHelper.authTokenDB)
                                      .get("token", defaultValue: "")!;
                                  if (token != "") {
                                    // print(widget.ourProductModel.productId);
                                    // print(favoriteList);
                                    await GraphQLService().addToFavorite(
                                        widget.ourProductModel.productId!,
                                        favoriteList,
                                        widget.ourProductModel
                                                .productAssets![0] ??
                                            ""
                                        // "https://www.fluttercampus.com/img/logo_small.webp",
                                        );
                                    // print("Authenticated");
                                  } else {
                                    OurToast().showErrorToast(
                                        "Please login to add to favorite list");
                                    print("Not logged in");
                                  }
                                },
                                child: Icon(
                                  favoriteList.contains(
                                          widget.ourProductModel.productId)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: darkgoldenLogoColor,
                                  size: ScreenUtil().setSp(22.5),
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Icon(
                                Icons.favorite_outline,
                                color: darkgoldenLogoColor,
                                size: ScreenUtil().setSp(22.5),
                              );
                            } else {
                              return Icon(
                                Icons.favorite_outline,
                                color: darkgoldenLogoColor,
                                size: ScreenUtil().setSp(22.5),
                              );
                            }
                          }),
                    )),
              ],
            ),
            SizedBox(
              height: ScreenUtil().setSp(2.5),
            ),
            // OurSizedBox(),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.ourProductModel.productName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                      color: darkLogoColor,
                      fontSize: ScreenUtil().setSp(15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setSp(2.5),
                  ),
                  SizedBox(
                    height: ScreenUtil().setSp(2.5),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setSp(10),
                      right: ScreenUtil().setSp(10),
                      bottom: ScreenUtil().setSp(5),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        StreamBuilder(
                            stream: RatingItemController.getData(
                              int.parse(widget.ourProductModel.productId ?? ""),
                              widget.ourProductModel.productVariantDetail![0]
                                  .slug!,
                            ),
                            builder: (BuildContext context,
                                AsyncSnapshot<RatingDetailModel?> snapshot) {
                              if (snapshot.hasData) {
                                RatingDetailModel ratingDetailModel =
                                    snapshot.data!;
                                return RatingStars(
                                  value: ratingDetailModel
                                              .customFields?.reviewRating !=
                                          null
                                      ? double.parse(ratingDetailModel
                                          .customFields!.reviewRating)
                                      : 0.0,
                                  starBuilder: (index, color) => Icon(
                                      Icons.favorite,
                                      color: color,
                                      size: ScreenUtil().setSp(17)),
                                  starCount: 5,
                                  starSize: ScreenUtil().setSp(15),
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
                                  animationDuration:
                                      const Duration(milliseconds: 800),
                                  valueLabelPadding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil().setSp(2),
                                    horizontal: ScreenUtil().setSp(2),
                                  ),
                                  valueLabelMargin: EdgeInsets.only(
                                    right: ScreenUtil().setSp(3),
                                  ),
                                  starOffColor: Colors.grey.shade300,
                                  starColor: darkgoldenLogoColor,
                                );
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Icon(
                                  Icons.favorite_outline,
                                  color: darkgoldenLogoColor,
                                  size: ScreenUtil().setSp(22.5),
                                );
                              } else {
                                return Icon(
                                  Icons.favorite_outline,
                                  color: darkgoldenLogoColor,
                                  size: ScreenUtil().setSp(22.5),
                                );
                              }
                            }),
                        // RatingStars(
                        //   value: 2.3,
                        //   starBuilder: (index, color) => Icon(
                        //     Icons.favorite,
                        //     color: color,
                        //     size: ScreenUtil().setSp(17),
                        //   ),
                        //   starCount: 5,
                        //   starSize: ScreenUtil().setSp(15),
                        //   valueLabelColor: const Color(0xff9b9b9b),
                        //   valueLabelTextStyle: TextStyle(
                        //     color: Colors.white,
                        //     fontWeight: FontWeight.w400,
                        //     fontStyle: FontStyle.normal,
                        //     fontSize: ScreenUtil().setSp(12),
                        //   ),
                        //   valueLabelRadius: ScreenUtil().setSp(20),
                        //   maxValue: 5,
                        //   starSpacing: 1,
                        //   maxValueVisibility: true,
                        //   valueLabelVisibility: true,
                        //   animationDuration: const Duration(milliseconds: 800),
                        //   valueLabelPadding: EdgeInsets.symmetric(
                        //     vertical: ScreenUtil().setSp(2),
                        //     horizontal: ScreenUtil().setSp(2),
                        //   ),
                        //   valueLabelMargin: EdgeInsets.only(
                        //     right: ScreenUtil().setSp(3),
                        //   ),
                        //   starOffColor: Colors.grey.shade300,
                        //   starColor: darkgoldenLogoColor,
                        // ),
                      ],
                    ),
                  ),
                  OurSizedBox(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: ScreenUtil().setSp(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(10),
                        vertical: ScreenUtil().setSp(3.5),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Color.fromRGBO(224, 69, 10, 1),
                      ),
                      child: Text(
                        widget.ourProductModel.lowPrice ==
                                widget.ourProductModel.highPrice
                            ? "${widget.ourProductModel.productVariantDetail![0].currencyCode} ${widget.ourProductModel.lowPrice! / 100}"
                            : "${widget.ourProductModel.productVariantDetail![0].currencyCode} ${widget.ourProductModel.lowPrice! / 100} - ${widget.ourProductModel.productVariantDetail![0].currencyCode} ${widget.ourProductModel.highPrice! / 100}",
                        // '${product.price}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12.5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
