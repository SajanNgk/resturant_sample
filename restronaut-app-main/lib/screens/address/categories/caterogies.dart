import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/models/our_category_model.dart';
import 'package:hyperce/screens/address/categories/model/categories_model.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  static List<FoodCategories> foodCategories = [
    FoodCategories(
      foodName: 'Chicken Wings',
      image: AppImages.chickenWings.path,
    ),
    FoodCategories(
      foodName: 'Cream role',
      image: AppImages.creamRole.path,
    ),
    FoodCategories(
      foodName: 'pasta',
      image: AppImages.pasta.path,
    ),
    FoodCategories(
      foodName: 'mexican',
      image: AppImages.mexican.path,
    ),
    FoodCategories(
      foodName: 'momo',
      image: AppImages.momo.path,
    ),
    FoodCategories(
      foodName: 'indian',
      image: AppImages.indian.path,
    ),
    FoodCategories(
      foodName: 'salad',
      image: AppImages.salad.path,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.h.verticalSpacer,
            TextFormField(
              decoration:
                  InputDecoration(hintText: 'Search, for food, category'),
            ),

            20.h.verticalSpacer,
            Text(
              "Top Categories",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),

            Container(
              height: 500,
              child: FutureBuilder(
                  future: GraphQLService().getcategory(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CategoryModel>?> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.length > 0) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimationLimiter(
                            child: SizedBox(
                              height: ScreenUtil().setSp(55),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: GridView.builder(
                                  itemCount: snapshot.data!.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1.1,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 12.0,
                                  ),
                                  itemBuilder: (context, index) {
                                    CategoryModel categoryModel =
                                        snapshot.data![index];
                                    return _builddummyFoodContainer(
                                        categoryModel.name!);
                                  },
                                ),

                                // ListView.builder(
                                //     scrollDirection: Axis.horizontal,
                                //     physics:
                                //         NeverScrollableScrollPhysics(),
                                //     shrinkWrap: true,
                                //     itemCount: snapshot.data!.length,
                                //     itemBuilder: (context, index) {
                                //       CategoryModel categoryModel =
                                //           snapshot.data![index];
                                //       return
                                //       _builddummyFoodContainer( categoryModel.name!);
                                //       // TabTextComponent(
                                //       //   title:
                                //       //       categoryModel.name ?? "",
                                //       //   index: index,
                                //       //   categoryModel: categoryModel,
                                //       // );
                                //       //  Text(categoryModel.name ?? "");
                                //     }),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: ScreenUtil().setSp(45),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              // vertical: ScreenUtil().setSp(5),
                              horizontal: ScreenUtil().setSp(5),
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setSp(5),
                                  ),
                                  child: Shimmer.fromColors(
                                    period: const Duration(seconds: 1),
                                    highlightColor: Colors.grey.shade200,
                                    baseColor: Colors.grey.shade500,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: ScreenUtil().setSp(150),
                                          height: ScreenUtil().setSp(25),
                                          decoration: ShapeDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            // shape: shapeBorder,
                                            shape: RoundedRectangleBorder(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return SizedBox(
                        height: ScreenUtil().setSp(50),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setSp(5),
                            horizontal: ScreenUtil().setSp(5),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setSp(5),
                                ),
                                child: Shimmer.fromColors(
                                  period: const Duration(seconds: 1),
                                  highlightColor: Colors.grey.shade200,
                                  baseColor: Colors.grey.shade500,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: ScreenUtil().setSp(150),
                                        height: ScreenUtil().setSp(25),
                                        decoration: ShapeDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          // shape: shapeBorder,
                                          shape: RoundedRectangleBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: ScreenUtil().setSp(50),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setSp(5),
                            horizontal: ScreenUtil().setSp(5),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setSp(5),
                                ),
                                child: Shimmer.fromColors(
                                  period: const Duration(seconds: 1),
                                  highlightColor: Colors.grey.shade200,
                                  baseColor: Colors.grey.shade500,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: ScreenUtil().setSp(150),
                                        height: ScreenUtil().setSp(25),
                                        decoration: ShapeDecoration(
                                          color: Colors.grey.withOpacity(0.3),
                                          // shape: shapeBorder,
                                          shape: RoundedRectangleBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                  }),
            )

            //         GridView.builder(
            //   itemCount: foodCategories.length,
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     childAspectRatio: 1.4,
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 8.0,
            //     mainAxisSpacing: 12.0,
            //   ),
            //   itemBuilder: (context, index) {
            //     return _buildFoodContainer(foodCategories[index]);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _builddummyFoodContainer(String dummyfoodCategories) {
    return Column(
      children: [
        Container(child: Image.asset(foodCategories[0].image)),
        5.h.verticalSpacer,
        Text(dummyfoodCategories),
      ],
    );
  }
}
