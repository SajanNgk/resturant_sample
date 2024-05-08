import 'dart:ui';

import 'package:hyperce/models/our_product_model.dart';
import 'package:hyperce/screens/widgets/our_product_grid_tile.dart';
import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../api/graphql_service.dart';
import '../widgets/our_product_grid_loading_widget.dart';

class CategoryProductScreen extends StatefulWidget {
  final String categoryName;
  final String categoryId;
  final String categorySlug;
  const CategoryProductScreen(
      {super.key,
      required this.categoryName,
      required this.categoryId,
      required this.categorySlug});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
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
          widget.categoryName,
          style: TextStyle(
            color: darkLogoColor,
            fontSize: ScreenUtil().setSp(20),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search_icon.svg',
              color: darkLogoColor,
              height: ScreenUtil().setSp(25),
              width: ScreenUtil().setSp(25),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + kToolbarHeight,
              ),
              FutureBuilder(
                  future: GraphQLService().getcategorybasedproduct(
                      int.parse(widget.categoryId), widget.categorySlug),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<dynamic, dynamic>>?> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length > 0) {
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: ScreenUtil().setSp(5),
                            mainAxisSpacing: ScreenUtil().setSp(5),
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            OurProductModel ourProductModel =
                                OurProductModel.fromJson(snapshot.data![index]);
                            // ProductModel productModel =
                            //     ProductModel.fromMap(snapshot.data!.docs[index]);
                            return OurProductGridTile(
                              ourProductModel: ourProductModel,
                            );
                          },
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
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
                            Text(
                              "No products available",
                              style: TextStyle(
                                color: darkLogoColor,
                                fontSize: ScreenUtil().setSp(22.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return OurProductGridLoadingScreen();
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
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
                          Text(
                            "Something went wrong",
                            style: TextStyle(
                              color: darkLogoColor,
                              fontSize: ScreenUtil().setSp(22.5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
