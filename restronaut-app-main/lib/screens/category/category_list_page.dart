import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/constants/app_constants.dart';
import 'package:hyperce/models/category.dart';
import 'package:hyperce/models/our_category_model.dart';
import 'package:hyperce/models/our_product_model.dart';
import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/search_text_controller.dart';
import '../widgets/our_product_grid_tile.dart';
import 'components/our_category_shimmer.dart';
import 'components/staggered_category_card.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  List<Category> searchResults = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.find<SearchTextController>().clearText();
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setSp(10),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Category List',
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                      ),
                      child: Obx(
                        () => TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: darkLogoColor,
                              fontSize: ScreenUtil().setSp(17.5),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/icons/search_icon.svg',
                              fit: BoxFit.scaleDown,
                              color: darkLogoColor,
                            ),
                            suffixIcon: Get.find<SearchTextController>()
                                    .searchText
                                    .value
                                    .isEmpty
                                ? Container()
                                : InkWell(
                                    child: Icon(
                                      Icons.delete,
                                      size: ScreenUtil().setSp(27.5),
                                      color: darkLogoColor,
                                    ),
                                    onTap: () {
                                      Get.find<SearchTextController>()
                                          .clearText();
                                      searchController.clear();
                                    },
                                  ),
                          ),
                          onChanged: (value) {
                            Get.find<SearchTextController>().changeText(value);
                          },
                        ),
                      )),
                ],
              ),
            ),
            Obx(
              () => Get.find<SearchTextController>().searchText.value.isEmpty
                  ? FutureBuilder(
                      future: GraphQLService().getcategory(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CategoryModel>?> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.length > 0) {
                            return AnimationLimiter(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    CategoryModel categoryModel =
                                        snapshot.data![index];
                                    return StaggeredCardCard(
                                      categoryModel: categoryModel,
                                      begin:
                                          Colors.grey.shade300.withOpacity(0.4),
                                      end:
                                          Colors.grey.shade300.withOpacity(0.4),
                                      categoryName: categoryModel.name ?? "",
                                      assetPath:
                                          categoryModel.assets?[0].source ?? "",
                                    );
                                  }),
                            );
                          } else {
                            return OurCategoryShimmer();
                          }
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return OurCategoryShimmer();
                        } else {
                          return Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
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
                            ),
                          );
                        }
                      })
                  : Expanded(
                      child: Column(
                        children: [
                          OurSizedBox(),
                          FutureBuilder(
                              future: GraphQLService().getNamebasedproduct(
                                Get.find<SearchTextController>()
                                    .searchText
                                    .value,
                              ),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<Map<dynamic, dynamic>>?>
                                      snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.length > 0) {
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                            OurProductModel.fromJson(
                                                snapshot.data![index]);
                                        // ProductModel productModel =
                                        //     ProductModel.fromMap(snapshot.data!.docs[index]);
                                        return OurProductGridTile(
                                          ourProductModel: ourProductModel,
                                        );
                                      },
                                    );
                                  } else {
                                    return OurCategoryShimmer();
                                  }
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return OurCategoryShimmer();
                                } else {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
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
          ],
        ),
      ),
    );
  }
}
