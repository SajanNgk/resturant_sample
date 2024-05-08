import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:hyperce/api/graphql_service.dart';
import 'package:hyperce/constants/constants.dart';
import 'package:hyperce/screens/delievery_page/delievery_to_me_page.dart';
// import 'package:hyperce/constants/app_colors.dart';
// import 'package:hyperce/controllers/search_text_controller.dart';
// import 'package:hyperce/models/our_category_model.dart';
// import 'package:hyperce/models/our_product_model.dart';
// import 'package:hyperce/models/product_model.dart';
// import 'package:hyperce/screens/category/components/our_category_shimmer.dart';
import 'package:hyperce/screens/home_page/model/featured_foods.dart';
import 'package:hyperce/screens/home_page/model/free_delievery_foods.dart';
// import 'package:hyperce/screens/home_page/widgets/sidebar.dart';
// import 'package:hyperce/screens/home_page/widgets/horizontal_scroll_button.dart';
import 'package:hyperce/screens/map/map.dart';
// import 'package:hyperce/screens/main/components/product_list.dart';
// import 'package:hyperce/screens/widgets/our_product_grid_tile.dart';
// import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
// import 'package:hyperce/utils/extensions/context_extension.dart';
import 'package:hyperce/utils/images.dart';

import '../../sidebar/sidebar.dart';

import '../catering_full_menu/catering_location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  static List<FeaturedFood> featuredFoods = [
    FeaturedFood(
        place: 'Burger',
        delieveryCharge: '1',
        image: AppImages.burger.path,
        time: '2',
        rating: 4.5),
    FeaturedFood(
        place: 'Pizza',
        delieveryCharge: '1',
        image: AppImages.pizza.path,
        time: '2',
        rating: 4.5),
  ];
  static List<FeaturedFood> freeFoods = [
    FeaturedFood(
        place: 'Caesar Palace',
        delieveryCharge: '1',
        image: AppImages.burger.path,
        time: '2',
        rating: 4.5),
    FeaturedFood(
        place: 'Holy Mary\'s',
        delieveryCharge: '1',
        image: AppImages.pizza.path,
        time: '2',
        rating: 4.5),
  ];
  static List<FeaturedFood> myLovedResturants = [
    FeaturedFood(
        place: 'Caesar Palace',
        delieveryCharge: '1',
        image: AppImages.chickenWings.path,
        time: '2',
        rating: 4.5),
    FeaturedFood(
        place: 'Holy Mary\'s',
        delieveryCharge: '1',
        image: AppImages.creamRole.path,
        time: '2',
        rating: 4.5),
  ];

  String selectedTimeline = featuredCategories[0];
  GraphQLService gp = GraphQLService();
  @override
  Widget build(BuildContext context) {
    gp.fetchProducts();
    var scaffold = SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              10.verticalSpacer,
              Container(
                height: 50,
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.backGroundImage.path,
                      fit: BoxFit.fill,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            Get.to(
                              SideBar(),
                            );
                          },
                        ),
                        Image.asset(AppImages.piccadilly.path),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            child: Image.asset(AppImages.storeLogo.path)),
                      ],
                    ),
                  ],
                ),
              ),
              30.verticalSpacer,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Afternoon, Zen",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    8.verticalSpacer,
                    Text(
                      'We \'re wishing you a\nHappy Hanukah',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              140.verticalSpacer,
              Stack(
                children: [
                  Image.asset(
                    AppImages.homePageImage.path,
                    // fit: BoxFit.fitWidth,
                  ),
                  Expanded(
                    child: Positioned(
                      top: 100,
                      left: 30,
                      child: Column(
                        children: [
                          //  PointShowcaseContainer(pointsAccumulated: '135'),
                          24.verticalSpace,
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              width: 300,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(ShowMap(
                                      isCatering: false,
                                    ));
                                  },
                                  child: Text('Pickup at the resturant')),
                            ),
                          ),
                          14.h.verticalSpacer,
                          Container(
                            width: 300,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.lightYelloColor),
                                onPressed: () {
                                  Get.to(DeliveryToMePage());
                                },
                                child: Text(
                                  'Deliever to me',
                                  style: TextStyle(
                                      color: AppColors.appTextSecondaryColor),
                                )),
                          ),
                          14.h.verticalSpacer,
                          Container(
                            width: 300,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                onPressed: () {
                                  Get.to(CateringLocaation());
                                },
                                child: Text(
                                  'Order Catering',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 13.verticalSpacer,
              // TextFormField(
              //   decoration:
              //       InputDecoration(hintText: 'Search, for food, category'),
              // ),
              // 13.verticalSpacer,
              // Container(
              //   height: 90.0,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: featuredFoods.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       final displayFoods = featuredFoods[index];
              //       return _buildCircularRegularFoodContainer(displayFoods);
              //     },
              //   ),
              // ),
              // 15.verticalSpacer,
              // // FutureBuilder(
              //               future: GraphQLService().getcategory(),
              //               builder: (BuildContext context,
              //                   AsyncSnapshot<List<CategoryModel>?> snapshot) {
              //                 if (snapshot.hasData) {
              //                   if (snapshot.data!.length > 0) {
              //                     return AnimationLimiter(
              //                       child:
              //                        Container(
              //                         height: 200,
              //                          child: ListView.builder(
              //                       scrollDirection: Axis.horizontal,
              //                                             // scrollDirection: Axis.horizontal,
              //                          //physics: NeverScrollableScrollPhysics(),
              //                             shrinkWrap: true,
              //                             itemCount: snapshot.data!.length,
              //                             itemBuilder: (context, index) {
              //                               CategoryModel categoryModel =
              //                                   snapshot.data![index];
              //                               return
              //                           Container(
              //      decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Colors.grey,
              //     ),
              //         width: 38.0,
              //         height: 38,// Adjust width as needed
              //         margin: EdgeInsets.all(8.0),

              //         child: Column(children:[Text(categoryModel.name!)] ),

              //       );

              //                               // StaggeredCardCard(
              //                               //   categoryModel: categoryModel,
              //                               //   begin: Colors.grey.shade300
              //                               //       .withOpacity(0.4),
              //                               //   end: Colors.grey.shade300
              //                               //       .withOpacity(0.4),
              //                               //   categoryName:
              //                               //       categoryModel.name ?? "",
              //                               //   assetPath:
              //                               //       categoryModel.assets?[0].source ??
              //                               //           "",
              //                               // );
              //                             }),
              //                        ),
              //                     );
              //                   } else {
              //                     return OurCategoryShimmer();
              //                   }
              //                 } else if (snapshot.connectionState ==
              //                     ConnectionState.waiting) {
              //                   return OurCategoryShimmer();
              //                 } else {
              //                   return Expanded(
              //                     child: Column(
              //                       children: [
              //                         SizedBox(
              //                           width: double.infinity,
              //                         ),
              //                         SizedBox(
              //                           height:
              //                               MediaQuery.of(context).size.height *
              //                                   0.15,
              //                         ),
              //                         ClipRRect(
              //                           borderRadius: BorderRadius.circular(
              //                             ScreenUtil().setSp(25),
              //                           ),
              //                           child: Image.asset(
              //                             'assets/logo.png',
              //                             height: ScreenUtil().setSp(175),
              //                             width: ScreenUtil().setSp(175),
              //                           ),
              //                         ),
              //                         OurSizedBox(),
              //                         Text(
              //                           "Something went wrong",
              //                           style: TextStyle(
              //                             color: darkLogoColor,
              //                             fontSize: ScreenUtil().setSp(22.5),
              //                             fontWeight: FontWeight.w500,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   );
              //                 }
              //               }),

              //   Container(
              //   height: 18.0, // Adjust height as needed
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: items.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Row(children: [FilterButton(isPrefixIcon: true, isSuffixIcon: true, buttonLabel: ),

              //       7.horizontalSpacer,

              //       ])

              //       ;
              //     },
              //   ),
              // ),

              // 15.h.verticalSpacer,
              // Text('Featured'),
              // GridView.builder(
              //   itemCount: featuredFoods.length,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     childAspectRatio: 1.4,
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 8.0,
              //     mainAxisSpacing: 12.0,
              //   ),
              //   itemBuilder: (context, index) {
              //     return _buildFoodContainer(featuredFoods[index]);
              //   },
              // ),

              // 15.h.verticalSpacer,

              // GridView.builder(
              //   itemCount: freeDelieveryFoods.length,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     childAspectRatio: 1.9,
              //     crossAxisCount: 3,
              //     crossAxisSpacing: 8.0,
              //     mainAxisSpacing: 12.0,
              //   ),
              //   itemBuilder: (context, index) {
              //     return _buildFreeDelieveryFoods(freeDelieveryFoods[index]);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
    return scaffold;
  }

  Widget _buildFreeDelieveryFoods(FreeDelieveryFoods freeDelieveryFoods) {
    return Column(
      children: [
        Container(width: 162.w, child: Image.asset(AppImages.food.path)),
        Text(freeDelieveryFoods.place)
      ],
    );
  }

  Widget _buildFoodContainer(FeaturedFood featuredFoods) {
    return Column(
      children: [
        Container(child: Image.asset(AppImages.food.path)),
        5.h.verticalSpacer,
        Text(featuredFoods.place),
      ],
    );
  }

  Widget _buildCircularRegularFoodContainer(FeaturedFood myfoods) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              // width: 38.0,
              // height: 38,// Adjust width as needed
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(myfoods.image)),
            ),
            13.h.verticalSpacer,
            Text(myfoods.place)
          ],
        ),
        32.w.horizontalSpacer
      ],
    );
  }
}
