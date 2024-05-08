import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/constants/app_constants.dart';
import 'package:hyperce/screens/address/add_address_page.dart';
import 'package:hyperce/screens/widgets/our_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

import '../../controllers/active_order_controller.dart';
import '../../widgets/custom_background.dart';
import '../../api/db/db_helper.dart';
import '../../models/our_active_order_model.dart';
import '../../constants/app_colors.dart';
import '../authentication/login_screen.dart';
import '../widgets/our_sized_box.dart';
import 'checkout_shimmer_effect.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    Widget checkOutButton = InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => AddAddressPage())),
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("Check Out",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return CustomPaint(
      painter: MainBackground(),
      child: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(12.5),
              vertical: ScreenUtil().setSp(12),
            ),
            child: ValueListenableBuilder(
              valueListenable:
                  Hive.box<String>(DatabaseHelper.authTokenDB).listenable(),
              builder: (context, Box<String> boxs, child) {
                String value = boxs.get("token", defaultValue: "")!;
                print("===========");
                print(value);
                print("===========");
                return value == ""
                    ? Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                          ),

                          Image.asset(
                            'assets/images/logo.png',
                            height: ScreenUtil().setSp(125),
                            width: ScreenUtil().setSp(125),
                          ),

                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(
                          //     ScreenUtil().setSp(25),
                          //   ),
                          //   child: Image.asset(
                          //     'assets/logo.png',
                          //     height: ScreenUtil().setSp(175),
                          //     width: ScreenUtil().setSp(175),
                          //   ),
                          // ),
                          OurSizedBox(),
                          Text(
                            "You neet to login in",
                            style: TextStyle(
                              color: darkLogoColor,
                              fontSize: ScreenUtil().setSp(22.5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          OurElevatedButton(
                            title: "Login",
                            function: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: LoginScreen(),
                                  type: PageTransitionType.leftToRight,
                                ),
                              );
                            },
                            color: darkLogoColor,
                            textColor: Colors.white,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 10,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setSp(7.5),
                                  vertical: ScreenUtil().setSp(7.5),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    ScreenUtil().setSp(15),
                                  ),
                                  color: Colors.grey.shade100,
                                ),
                                // height: ScreenUtil().setSp(27.5),
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    "My Cart",
                                    style: TextStyle(
                                      color: darkLogoColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().setSp(25),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          OurSizedBox(),
                          OurSizedBox(),
                          StreamBuilder(
                              stream: ActiveOrderController.getData(),
                              // future: GraphQLService().getcategorybasedproduct(
                              //     int.parse(widget.categoryId), widget.categorySlug),
                              builder: (BuildContext context,
                                  AsyncSnapshot<ActiveOrderModel?> snapshot) {
                                if (snapshot.hasData) {
                                  ActiveOrderModel activeOrderModel =
                                      snapshot.data!;

                                  return Column(
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              activeOrderModel.lines!.length,
                                          itemBuilder: (context, index) {
                                            ProductVariant productVariant =
                                                activeOrderModel.lines![index]
                                                    .productVariant!;

                                            Lines linesModel =
                                                activeOrderModel.lines![index];
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  ScreenUtil().setSp(12.5),
                                                ),
                                                color: Colors.grey.shade300
                                                    .withOpacity(0.4),
                                              ),
                                              margin: EdgeInsets.only(
                                                left: ScreenUtil().setSp(5),
                                                right: ScreenUtil().setSp(5),
                                                bottom: ScreenUtil().setSp(5),
                                                top: ScreenUtil().setSp(5),
                                              ),
                                              padding: EdgeInsets.only(
                                                left: ScreenUtil().setSp(5),
                                                right: ScreenUtil().setSp(5),
                                                bottom: ScreenUtil().setSp(5),
                                                top: ScreenUtil().setSp(5),
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      child: CachedNetworkImage(
                                                        height: ScreenUtil()
                                                            .setSp(90),
                                                        fit: BoxFit.fill,
                                                        imageUrl: productVariant
                                                                .assets!.isEmpty
                                                            ? productVariant
                                                                    .product!
                                                                    .featuredAsset!
                                                                    .source ??
                                                                ""
                                                            : productVariant
                                                                    .assets![0]
                                                                    .preview ??
                                                                "",
                                                        placeholder:
                                                            (context, url) =>
                                                                Image.asset(
                                                          "assets/profile_holder.png",
                                                          height: ScreenUtil()
                                                              .setSp(90),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: ScreenUtil()
                                                        .setSp(12.5),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      height: ScreenUtil()
                                                          .setSp(90),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                            productVariant
                                                                    .name ??
                                                                "",
                                                            style: TextStyle(
                                                              color:
                                                                  darkLogoColor,
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          15),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: ScreenUtil()
                                                                .setSp(2),
                                                          ),
                                                          Text(
                                                            "${activeOrderModel.currencyCode} ${(linesModel.unitPrice! / 100).toString()}",
                                                            style: TextStyle(
                                                              color:
                                                                  darkLogoColor,
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          12.5),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          // print("Minus buttom pressed");
                                                          await GraphQLService()
                                                              .removeItemFromCart(
                                                            int.parse(
                                                                linesModel.id ??
                                                                    ""),
                                                          );
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.red,
                                                          ),
                                                          margin:
                                                              EdgeInsets.only(
                                                            right: ScreenUtil()
                                                                .setSp(5),
                                                            left: ScreenUtil()
                                                                .setSp(5),
                                                            top: ScreenUtil()
                                                                .setSp(4),
                                                            bottom: ScreenUtil()
                                                                .setSp(4),
                                                          ),
                                                          padding:
                                                              EdgeInsets.only(
                                                            right: ScreenUtil()
                                                                .setSp(5),
                                                            left: ScreenUtil()
                                                                .setSp(5),
                                                            top: ScreenUtil()
                                                                .setSp(4),
                                                            bottom: ScreenUtil()
                                                                .setSp(4),
                                                          ),
                                                          child: Icon(
                                                            MdiIcons.delete,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      OurSizedBox(),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          InkWell(
                                                            onTap: () async {
                                                              if (linesModel
                                                                      .quantity! >
                                                                  1) {
                                                                try {
                                                                  await GraphQLService().addremoveMutation(
                                                                      int.parse(
                                                                          linesModel.id ??
                                                                              ""),
                                                                      linesModel
                                                                              .quantity! -
                                                                          1);
                                                                } catch (e) {
                                                                  print(e);
                                                                }
                                                              }
                                                              // print(activeOrderModel.id);
                                                              // print("Minus buttom pressed");
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    darkLogoColor,
                                                              ),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                right:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            5),
                                                                left:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            5),
                                                                top:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            4),
                                                                bottom:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            4),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                right:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            5),
                                                                left:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            5),
                                                                top:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            4),
                                                                bottom:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            4),
                                                              ),
                                                              child: Icon(
                                                                MdiIcons.minus,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child:
                                                                AnimatedSwitcher(
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          250),
                                                              transitionBuilder:
                                                                  (Widget child,
                                                                      Animation<
                                                                              double>
                                                                          animation) {
                                                                return ScaleTransition(
                                                                    child:
                                                                        child,
                                                                    scale:
                                                                        animation);
                                                              },
                                                              child: Text(
                                                                linesModel
                                                                    .quantity
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      goldenLogoColor,
                                                                  fontSize:
                                                                      ScreenUtil()
                                                                          .setSp(
                                                                              17.5),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              try {
                                                                await GraphQLService().addremoveMutation(
                                                                    int.parse(
                                                                        linesModel.id ??
                                                                            ""),
                                                                    linesModel
                                                                            .quantity! +
                                                                        1);
                                                              } catch (e) {
                                                                print(e);
                                                              }
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    darkLogoColor,
                                                              ),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                right:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            5),
                                                                left:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            5),
                                                                top:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            4),
                                                                bottom:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            4),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                right:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            5),
                                                                left:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            5),
                                                                top:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            4),
                                                                bottom:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            4),
                                                              ),
                                                              child: Icon(
                                                                MdiIcons.plus,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                      OurSizedBox(),
                                      activeOrderModel.lines!.isEmpty
                                          ? Column(
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.15,
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    ScreenUtil().setSp(25),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/logo.png',
                                                    height:
                                                        ScreenUtil().setSp(175),
                                                    width:
                                                        ScreenUtil().setSp(175),
                                                  ),
                                                ),
                                                OurSizedBox(),
                                                Text(
                                                  "No item in cart",
                                                  style: TextStyle(
                                                    color: darkLogoColor,
                                                    fontSize: ScreenUtil()
                                                        .setSp(22.5),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Total:",
                                                  style: TextStyle(
                                                    color: darkLogoColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        ScreenUtil().setSp(20),
                                                  ),
                                                ),
                                                Text(
                                                  "${activeOrderModel.currencyCode} ${(activeOrderModel.totalWithTax! / 100).toString()}",
                                                  style: TextStyle(
                                                    color: goldenLogoColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: ScreenUtil()
                                                        .setSp(17.5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ],
                                  );
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CheckOutShimmerWidget();
                                } else {
                                  return CheckOutShimmerWidget();
                                }
                              }),
                        ],
                      );
              },
            )),
      ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    LinearGradient grT = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
