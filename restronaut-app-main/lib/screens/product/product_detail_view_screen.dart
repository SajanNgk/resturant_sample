import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/controllers/cart_animation_controller.dart';
import 'package:hyperce/controllers/product_varient_controller.dart';
import 'package:hyperce/models/our_product_model.dart';
import 'package:hyperce/screens/authentication/login_screen.dart';
import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:page_transition/page_transition.dart';

import '../../controllers/favourite_item_controller.dart';
import '../../api/db/db_helper.dart';
import '../widgets/our_dropdownsearch_widget.dart';
import '../widgets/our_elevated_button.dart';
import '../widgets/our_flutter_toast.dart';
import '../widgets/our_image_detail_loader.dart';

class OurProductDetailViewScreen extends StatefulWidget {
  final OurProductModel ourProductModel;
  const OurProductDetailViewScreen({super.key, required this.ourProductModel});

  @override
  State<OurProductDetailViewScreen> createState() =>
      _OurProductDetailViewScreenState();
}

class _OurProductDetailViewScreenState extends State<OurProductDetailViewScreen>
    with TickerProviderStateMixin {
  TextEditingController _varientName = TextEditingController();
  int pictureIndex = 0;
  late Animation<double?> sizeAnimation, cartAnimation, paddingAnimation;
  late AnimationController cartController;
  bool state = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _varientName.text =
        widget.ourProductModel.productVariantDetail![0].productVariantName!;
    cartController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    cartAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 24, end: 28), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 28, end: 24), weight: 50)
    ]).animate(cartController);
    paddingAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 16, end: 14), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 14, end: 16), weight: 50)
    ]).animate(cartController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              FocusScope.of(context).unfocus();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: darkLogoColor,
              size: ScreenUtil().setSp(30),
            ),
          ),
          flexibleSpace: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white.withAlpha(200),
          title: Text(
            widget.ourProductModel.productName ?? "",
            style: TextStyle(
              color: darkLogoColor,
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.only(
                right: ScreenUtil().setSp(15),
              ),
              child: StreamBuilder(
                  stream: FavoriteItemController.getData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>?> snapshot) {
                    if (snapshot.hasData) {
                      List<String> favoriteList = snapshot.data!;
                      return InkWell(
                        onTap: () async {
                          String token =
                              Hive.box<String>(DatabaseHelper.authTokenDB)
                                  .get("token", defaultValue: "")!;
                          if (token != "") {
                            // print(widget.ourProductModel.productId);
                            // print(favoriteList);

                            await GraphQLService().addToFavorite(
                              widget.ourProductModel.productId!,
                              favoriteList,
                              widget.ourProductModel.productAssets![0],
                            );
//  String imageUrl =
//                                 "https://www.fluttercampus.com/img/logo_small.webp";
//                             print(imageUrl);
//                             NotificationService().simpleBigPictureNotification(
//                               "Product added to favorite",
//                               imageUrl,
//                             );
                            // print("Authenticated");
                          } else {
                            OurToast().showErrorToast(
                                "Please login to add to favorite list");
                            print("Not logged in");
                          }
                          // NotificationService().simpleBigPictureNotification(
                          //   "Item added to cart",
                          //   widget.ourProductModel.productAssets![0] ?? "",
                          // );
                        },
                        child: Icon(
                          favoriteList
                                  .contains(widget.ourProductModel.productId)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: darkgoldenLogoColor,
                          size: ScreenUtil().setSp(30),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Icon(
                        Icons.favorite_outline,
                        color: darkgoldenLogoColor,
                        size: ScreenUtil().setSp(30),
                      );
                    } else {
                      return Icon(
                        Icons.favorite_outline,
                        color: darkgoldenLogoColor,
                        size: ScreenUtil().setSp(30),
                      );
                    }
                  }),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: GraphQLService().getproductImages(
                      int.parse(widget.ourProductModel.productVariantDetail![0]
                              .productId ??
                          ""),
                      widget.ourProductModel.productVariantDetail![0].slug ??
                          "",
                    ),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<String>?> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.length > 0) {
                          return Container(
                            // color: Colors.red,
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.zero,
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: ((context, index) {
                                          // return Text('data');
                                          return InkWell(
                                            onTap: () {
                                              Get.find<
                                                      ProductVarientController>()
                                                  .changeIndex(index);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                left: ScreenUtil().setSp(7.5),
                                                right: ScreenUtil().setSp(7.5),
                                                bottom: ScreenUtil().setSp(7.5),
                                                top: ScreenUtil().setSp(7.5),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  ScreenUtil().setSp(17.5),
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      snapshot.data![index],
                                                  // Image.network(
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                    "assets/profile_holder.png",
                                                  ),
                                                  height:
                                                      ScreenUtil().setSp(125),
                                                  width:
                                                      ScreenUtil().setSp(125),
                                                  fit: BoxFit.fitWidth,
                                                  //   )
                                                ),
                                              ),
                                            ),
                                          );
                                          //  Text(snapshot.data![index]);
                                        })),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.05,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      left: ScreenUtil().setSp(7.5),
                                      right: ScreenUtil().setSp(7.5),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setSp(17.5),
                                      ),
                                      child: Obx(
                                        () => CachedNetworkImage(
                                          imageUrl: snapshot.data![Get.find<
                                                  ProductVarientController>()
                                              .productVarientIndex
                                              .value],
                                          // Image.network(
                                          placeholder: (context, url) =>
                                              Image.asset(
                                            "assets/profile_holder.png",
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          width: ScreenUtil().setSp(125),
                                          fit: BoxFit.fitWidth,
                                          //   )
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return OurImageDetailLoader();
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return OurImageDetailLoader();
                      } else {
                        return OurImageDetailLoader();
                      }
                    }),
                OurSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.ourProductModel.productName ?? "",
                        style: TextStyle(
                          color: darkLogoColor,
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: widget
                                    .ourProductModel
                                    .productVariantDetail![
                                        Get.find<ProductVarientController>()
                                            .currentIndex
                                            .value]
                                    .inStock ==
                                true
                            ? Color(0xffDCFCE7)
                            : Color(0xffFEE2E2),
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setSp(12.5),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(5),
                        vertical: ScreenUtil().setSp(5),
                      ),
                      child: Text(
                        widget
                                    .ourProductModel
                                    .productVariantDetail![
                                        Get.find<ProductVarientController>()
                                            .currentIndex
                                            .value]
                                    .inStock ==
                                true
                            ? "In stock"
                            : "Out of stock",
                        style: TextStyle(
                          color: widget
                                      .ourProductModel
                                      .productVariantDetail![
                                          Get.find<ProductVarientController>()
                                              .currentIndex
                                              .value]
                                      .inStock ==
                                  true
                              ? Color(0xff166534)
                              : Color(0xff991B1B),
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                OurSizedBox(),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.ourProductModel.productVariantDetail![Get.find<ProductVarientController>().currentIndex.value].currencyCode}.  ${widget.ourProductModel.productVariantDetail![Get.find<ProductVarientController>().currentIndex.value].priceWithTax! / 100}"
                            .toString(),
                        style: TextStyle(
                          color: darkgoldenLogoColor,
                          fontSize: ScreenUtil().setSp(18.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {}, //,=> Navigator.push(
                        //   context,
                        //   PageTransition(
                        //     child: RatingPage(
                        //       ourProductModel: widget.ourProductModel,
                        //     ),
                        //     type: PageTransitionType.leftToRight,
                        //   ),
                        // )
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        // builder: (_) => RatingPage(
                        //   ourProductModel: widget.ourProductModel,
                        // ),
                        //   ),
                        // ),
                        // constraints: BoxConstraints(
                        //   minWidth: ScreenUtil().setSp(30),
                        //   minHeight: ScreenUtil().setSp(30),
                        // ),
                        child: Icon(Icons.favorite,
                            size: ScreenUtil().setSp(30),
                            color: Color.fromRGBO(255, 137, 147, 1)),
                        elevation: 0.0,
                        shape: CircleBorder(),
                        fillColor: Color.fromRGBO(255, 255, 255, 0.4),
                      ),
                    ],
                  ),
                ),
                OurSizedBox(),
                Text(
                  "Select Option:",
                  style: TextStyle(
                    color: darkLogoColor,
                    fontSize: ScreenUtil().setSp(17.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OurSizedBox(),
                OurFlutterDropdownSearch(
                  hintText: "Category",
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(17.5),
                    fontWeight: FontWeight.w400,
                    // color: logoColor,
                  ),
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(17.5),
                    fontWeight: FontWeight.w400,
                    // color: logoColor,
                  ),
                  textController: _varientName,
                  items:
                      Get.find<ProductVarientController>().productVarientName,
                  dropdownHeight: ScreenUtil().setSp(125),
                ),
                OurSizedBox(),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setSp(5),
                  ),
                  child: Row(
                    children: [
                      AnimatedBuilder(
                        animation: cartController,
                        builder: (BuildContext context, _) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                ScreenUtil().setSp(8.5),
                              ),
                              color: widget
                                          .ourProductModel
                                          .productVariantDetail![Get.find<
                                                  ProductVarientController>()
                                              .currentIndex
                                              .value]
                                          .inStock ==
                                      true
                                  ? Color(0xffDCFCE7)
                                  : Color(0xffFEE2E2),
                            ),
                            height: ScreenUtil().setSp(50),
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setSp(10),
                              vertical: ScreenUtil().setSp(10),
                            ),
                            child: Icon(
                              FeatherIcons.shoppingBag,
                              color: widget
                                          .ourProductModel
                                          .productVariantDetail![Get.find<
                                                  ProductVarientController>()
                                              .currentIndex
                                              .value]
                                          .inStock ==
                                      true
                                  ? Color(0xff166534)
                                  : Color(0xff991B1B),
                              // color: theme.colorScheme.primary,
                              size: cartAnimation.value,
                            ),

                            // paddingAll:
                            //     controller.paddingAnimation.value,
                          );
                        },
                      ),
                      Expanded(
                          child: Center(
                        child: OurElevatedButton(
                          title: widget
                                      .ourProductModel
                                      .productVariantDetail![
                                          Get.find<ProductVarientController>()
                                              .currentIndex
                                              .value]
                                      .inStock ==
                                  true
                              ? "Add to Cart"
                              : "Out of Stock",
                          function: () async {
                            if (widget
                                    .ourProductModel
                                    .productVariantDetail![
                                        Get.find<ProductVarientController>()
                                            .currentIndex
                                            .value]
                                    .inStock ==
                                false) {
                              print("No left in stock");
                            } else {
                              String token =
                                  Hive.box<String>(DatabaseHelper.authTokenDB)
                                      .get("token", defaultValue: "")!;
                              if (token != "") {
                                print("Authenticated");
                                print(
                                    Hive.box<String>(DatabaseHelper.authTokenDB)
                                        .get("token", defaultValue: "")!);
                                print(widget
                                    .ourProductModel
                                    .productVariantDetail![
                                        Get.find<ProductVarientController>()
                                            .currentIndex
                                            .value]
                                    .productVariantId);
                                print(widget
                                    .ourProductModel
                                    .productVariantDetail![
                                        Get.find<ProductVarientController>()
                                            .currentIndex
                                            .value]
                                    .priceWithTax);
                                await GraphQLService().addToCart(
                                    int.parse(widget
                                            .ourProductModel
                                            .productVariantDetail![Get.find<
                                                    ProductVarientController>()
                                                .currentIndex
                                                .value]
                                            .productVariantId ??
                                        ""),
                                    1,
                                    context);
                              } else {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: LoginScreen(),
                                    type: PageTransitionType.leftToRight,
                                  ),
                                );
                              }
                              if (Get.find<CartAnimationController>()
                                      .state
                                      .value ==
                                  false) {
                                cartController.forward();
                                Get.find<CartAnimationController>()
                                    .toggleValue();
                              } else {
                                cartController.reverse();
                                Get.find<CartAnimationController>()
                                    .toggleValue();
                              }
                            }
                          },
                          color: widget
                                      .ourProductModel
                                      .productVariantDetail![
                                          Get.find<ProductVarientController>()
                                              .currentIndex
                                              .value]
                                      .inStock ==
                                  true
                              ? Color(0xffDCFCE7)
                              : Color(0xffFEE2E2),
                          textColor: widget
                                      .ourProductModel
                                      .productVariantDetail![
                                          Get.find<ProductVarientController>()
                                              .currentIndex
                                              .value]
                                      .inStock ==
                                  true
                              ? Color(0xff166534)
                              : Color(0xff991B1B),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        // Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       print("Pressed");
        // GraphQLService().getproductImages(
        //   int.parse(
        //       widget.ourProductModel.productVariantDetail![0].productId ??
        //           ""),
        //   widget.ourProductModel.productVariantDetail![0].slug ?? "",
        // );
        //     },
        //     child: Text("Press me"),
        //   ),
        // ),
        );
  }
}
