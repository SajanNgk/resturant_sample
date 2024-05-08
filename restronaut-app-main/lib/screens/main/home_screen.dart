// import 'package:flutter/material.dart';
// import 'package:hyperce/constants/constants.dart';
// import 'package:hyperce/controllers/collection_controller.dart';
// import 'package:hyperce/controllers/mero_product_controller.dart';
// import 'package:hyperce/models/product_model.dart';
// import 'package:hyperce/widgets/custom_background.dart';
// import 'package:hyperce/screens/main/components/tab_text_component.dart';
// import 'package:hyperce/screens/notifications_page.dart';
// import 'package:hyperce/screens/search_page.dart';
// import 'package:hyperce/screens/widgets/our_sized_box.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../api/graphql_service.dart';
// import '../../controllers/our_tab_controller.dart';
// import '../../models/our_category_model.dart';
// import '../../models/our_product_model.dart';
// import '../widgets/our_product_grid_loading_widget.dart';
// import '../widgets/our_product_grid_tile.dart';

// import 'components/product_list.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   String selectedTimeline = featuredCategories[0];
//   late TabController tabController;
//   CategoryModel categoryModel = CategoryModel();
//   GraphQLService gp = GraphQLService();

//   @override
//   void initState() {
//     super.initState();
//     final productController =
//         Get.find<ProductController>().categorizeAndPrintProducts();

//     tabController = TabController(vsync: this, length: 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     gp.fetchProducts();
//     // Appbar Widget
//     Widget appBar = Container(
//       height: kToolbarHeight + MediaQuery.of(context).padding.top,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           IconButton(
//             onPressed: () => Get.to(() => NotificationsPage()),
//             icon: Icon(
//               Icons.notifications,
//               color: darkLogoColor,
//               size: ScreenUtil().setSp(35),
//             ),
//           ),
//           Text(
//             "RestroNaut",
//             style: TextStyle(
//               color: darkgoldenLogoColor,
//               fontSize: ScreenUtil().setSp(25),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           IconButton(
//             onPressed: () => Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (_) => SearchPage(),
//               ),
//             ),
//             icon: SvgPicture.asset(
//               'assets/icons/search_icon.svg',
//               color: goldenLogoColor,
//               height: ScreenUtil().setSp(25),
//               width: ScreenUtil().setSp(25),
//             ),
//           )
//         ],
//       ),
//     );

//     // New Hot and new
//     Widget topHeader = Padding(
//         padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Flexible(
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     selectedTimeline = featuredCategories[0];
//                     gp.fetchProducts();
//                   });
//                 },
//                 child: Text(
//                   featuredCategories[0],
//                   style: TextStyle(
//                     fontSize: featuredCategories[0] == selectedTimeline
//                         ? ScreenUtil().setSp(21.5)
//                         : ScreenUtil().setSp(15.5),
//                     color: darkgoldenLogoColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//             Flexible(
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     selectedTimeline = featuredCategories[1];
//                     gp.fetchProducts();
//                   });
//                 },
//                 child: Text(
//                   featuredCategories[1],
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: featuredCategories[1] == selectedTimeline
//                         ? ScreenUtil().setSp(21.5)
//                         : ScreenUtil().setSp(15.5),
//                     color: darkgoldenLogoColor,
//                   ),
//                 ),
//               ),
//             ),
//             Flexible(
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     selectedTimeline = featuredCategories[2];
//                     gp.fetchProducts();
//                   });
//                 },
//                 child: Text(
//                   featuredCategories[2],
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontSize: featuredCategories[2] == selectedTimeline
//                         ? ScreenUtil().setSp(21.5)
//                         : ScreenUtil().setSp(15.5),
//                     color: darkgoldenLogoColor,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));

//     return Scaffold(
//       body: CustomPaint(
//         painter: MainBackground(),
//         size: MediaQuery.of(context).size,
//         child: TabBarView(
//           controller: tabController,
//           physics: NeverScrollableScrollPhysics(),
//           children: <Widget>[
//             SafeArea(
//               child: NestedScrollView(
//                 headerSliverBuilder:
//                     (BuildContext context, bool innerBoxIsScrolled) {
//                   // These are the slivers that show up in the "outer" scroll view.
//                   return <Widget>[
//                     SliverToBoxAdapter(
//                       child: appBar,
//                     ),
//                     SliverToBoxAdapter(
//                       child: topHeader,
//                     ),
//                     SliverToBoxAdapter(
//                       child: OurSizedBox(),
//                     ),

//                     /// here the below products need list data from the backend, but there is dummy static for that
//                     /// we need to replace these sample products with actual product data when integrating the application
//                     /// write the dummy data with list of products from product_model.dart
//                     SliverToBoxAdapter(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: FutureBuilder<List<List<ProductModel>>?>(
//                           future: gp.fetchProducts(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return Center(
//                                 child: CircularProgressIndicator(
//                                   color: goldenLogoColor,
//                                 ),
//                               );
//                             } else if (snapshot.hasError) {
//                               return Text('Error: ${snapshot.error}');
//                             } else if (!snapshot.hasData ||
//                                 snapshot.data!.isEmpty) {
//                               return Text('No data available.');
//                             } else {
//                               List<List<ProductModel>>? allProducts =
//                                   snapshot.data;
//                               List<ProductModel> productListToDisplay;

//                               if (selectedTimeline == featuredCategories[0]) {
//                                 productListToDisplay =
//                                     allProducts![0]; // hotDummyProducts
//                               } else if (selectedTimeline ==
//                                   featuredCategories[1]) {
//                                 productListToDisplay =
//                                     allProducts![1]; // topRatedProducts
//                               } else {
//                                 productListToDisplay =
//                                     allProducts![2]; // topProducts
//                               }

//                               if (productListToDisplay.isNotEmpty) {
//                                 return ProductList(
//                                     products: productListToDisplay);
//                               } else {
//                                 return Center(
//                                   child: CircularProgressIndicator(
//                                     color: goldenLogoColor,
//                                   ),
//                                 );
//                               }
//                             }
//                           },
//                         ),
//                       ),
//                     ),

//                     SliverToBoxAdapter(
//                       child: OurSizedBox(),
//                     ),
//                     SliverToBoxAdapter(
//                         child: FutureBuilder(
//                             future: GraphQLService().getcategory(),
//                             builder: (BuildContext context,
//                                 AsyncSnapshot<List<CategoryModel>?> snapshot) {
//                               if (snapshot.hasData) {
//                                 if (snapshot.data!.length > 0) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: AnimationLimiter(
//                                       child: SizedBox(
//                                         height: ScreenUtil().setSp(55),
//                                         child: SingleChildScrollView(
//                                           scrollDirection: Axis.horizontal,
//                                           child: ListView.builder(
//                                               scrollDirection: Axis.horizontal,
//                                               physics:
//                                                   NeverScrollableScrollPhysics(),
//                                               shrinkWrap: true,
//                                               itemCount: snapshot.data!.length,
//                                               itemBuilder: (context, index) {
//                                                 CategoryModel categoryModel =
//                                                     snapshot.data![index];
//                                                 return TabTextComponent(
//                                                   title:
//                                                       categoryModel.name ?? "",
//                                                   index: index,
//                                                   categoryModel: categoryModel,
//                                                 );
//                                                 //  Text(categoryModel.name ?? "");
//                                               }),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 } else {
//                                   return SizedBox(
//                                     height: ScreenUtil().setSp(45),
//                                     child: Container(
//                                       margin: EdgeInsets.symmetric(
//                                         // vertical: ScreenUtil().setSp(5),
//                                         horizontal: ScreenUtil().setSp(5),
//                                       ),
//                                       child: ListView.builder(
//                                         scrollDirection: Axis.horizontal,
//                                         itemCount: 5,
//                                         itemBuilder: (context, index) {
//                                           return Container(
//                                             margin: EdgeInsets.symmetric(
//                                               horizontal: ScreenUtil().setSp(5),
//                                             ),
//                                             child: Shimmer.fromColors(
//                                               period:
//                                                   const Duration(seconds: 1),
//                                               highlightColor:
//                                                   Colors.grey.shade200,
//                                               baseColor: Colors.grey.shade500,
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Container(
//                                                     width:
//                                                         ScreenUtil().setSp(150),
//                                                     height:
//                                                         ScreenUtil().setSp(25),
//                                                     decoration: ShapeDecoration(
//                                                       color: Colors.grey
//                                                           .withOpacity(0.3),
//                                                       // shape: shapeBorder,
//                                                       shape:
//                                                           RoundedRectangleBorder(),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   );
//                                 }
//                               } else if (snapshot.connectionState ==
//                                   ConnectionState.waiting) {
//                                 return SizedBox(
//                                   height: ScreenUtil().setSp(50),
//                                   child: Container(
//                                     margin: EdgeInsets.symmetric(
//                                       vertical: ScreenUtil().setSp(5),
//                                       horizontal: ScreenUtil().setSp(5),
//                                     ),
//                                     child: ListView.builder(
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: 5,
//                                       itemBuilder: (context, index) {
//                                         return Container(
//                                           margin: EdgeInsets.symmetric(
//                                             horizontal: ScreenUtil().setSp(5),
//                                           ),
//                                           child: Shimmer.fromColors(
//                                             period: const Duration(seconds: 1),
//                                             highlightColor:
//                                                 Colors.grey.shade200,
//                                             baseColor: Colors.grey.shade500,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Container(
//                                                   width:
//                                                       ScreenUtil().setSp(150),
//                                                   height:
//                                                       ScreenUtil().setSp(25),
//                                                   decoration: ShapeDecoration(
//                                                     color: Colors.grey
//                                                         .withOpacity(0.3),
//                                                     // shape: shapeBorder,
//                                                     shape:
//                                                         RoundedRectangleBorder(),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 );
//                               } else {
//                                 return SizedBox(
//                                   height: ScreenUtil().setSp(50),
//                                   child: Container(
//                                     margin: EdgeInsets.symmetric(
//                                       vertical: ScreenUtil().setSp(5),
//                                       horizontal: ScreenUtil().setSp(5),
//                                     ),
//                                     child: ListView.builder(
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: 5,
//                                       itemBuilder: (context, index) {
//                                         return Container(
//                                           margin: EdgeInsets.symmetric(
//                                             horizontal: ScreenUtil().setSp(5),
//                                           ),
//                                           child: Shimmer.fromColors(
//                                             period: const Duration(seconds: 1),
//                                             highlightColor:
//                                                 Colors.grey.shade200,
//                                             baseColor: Colors.grey.shade500,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Container(
//                                                   width:
//                                                       ScreenUtil().setSp(150),
//                                                   height:
//                                                       ScreenUtil().setSp(25),
//                                                   decoration: ShapeDecoration(
//                                                     color: Colors.grey
//                                                         .withOpacity(0.3),
//                                                     // shape: shapeBorder,
//                                                     shape:
//                                                         RoundedRectangleBorder(),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                 );
//                               }
//                             })),
//                     SliverToBoxAdapter(
//                       child: OurSizedBox(),
//                     ),
//                   ];
//                 },
//                 body: Obx(
//                   () => Get.find<OurCollectionController>()
//                               .collectionID
//                               .value
//                               .isNotEmpty ||
//                           Get.find<OurCollectionController>()
//                               .collectionSlug
//                               .value
//                               .isNotEmpty
//                       ? FutureBuilder(
//                           future: GraphQLService().getcategorybasedproduct(
//                               int.parse(
//                                   Get.find<OurCollectionController>().collectionID.value[
//                                           Get.find<OurTabController>()
//                                               .index
//                                               .value] ??
//                                       ""),
//                               Get.find<OurCollectionController>().collectionSlug.value[
//                                       Get.find<OurTabController>()
//                                           .index
//                                           .value] ??
//                                   ""),
//                           builder: (BuildContext context,
//                               AsyncSnapshot<List<Map<dynamic, dynamic>>?> snapshot) {
//                             if (snapshot.hasData) {
//                               if (snapshot.data!.length > 0) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: GridView.builder(
//                                     padding: EdgeInsets.zero,
//                                     shrinkWrap: true,
//                                     physics:
//                                         const NeverScrollableScrollPhysics(),
//                                     itemCount: snapshot.data!.length,
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 2,
//                                       crossAxisSpacing: ScreenUtil().setSp(5),
//                                       mainAxisSpacing: ScreenUtil().setSp(5),
//                                       childAspectRatio: 0.6,
//                                     ),
//                                     itemBuilder: (context, index) {
//                                       OurProductModel ourProductModel =
//                                           OurProductModel.fromJson(
//                                               snapshot.data![index]);
//                                       // ProductModel productModel =
//                                       //     ProductModel.fromMap(snapshot.data!.docs[index]);
//                                       return OurProductGridTile(
//                                         ourProductModel: ourProductModel,
//                                       );
//                                     },
//                                   ),
//                                 );
//                               } else {
//                                 return Column(
//                                   children: [
//                                     SizedBox(
//                                       width: double.infinity,
//                                     ),
//                                     OurSizedBox(),
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(
//                                         ScreenUtil().setSp(25),
//                                       ),
//                                       child: Image.asset(
//                                         'assets/logo.png',
//                                         height: ScreenUtil().setSp(175),
//                                         width: ScreenUtil().setSp(175),
//                                       ),
//                                     ),
//                                     OurSizedBox(),
//                                     Text(
//                                       "No products available",
//                                       style: TextStyle(
//                                         color: darkLogoColor,
//                                         fontSize: ScreenUtil().setSp(22.5),
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 );
//                               }
//                             } else if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return OurProductGridLoadingScreen();
//                             } else {
//                               return Column(
//                                 children: [
//                                   SizedBox(
//                                     width: double.infinity,
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         0.15,
//                                   ),
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(
//                                       ScreenUtil().setSp(25),
//                                     ),
//                                     child: Image.asset(
//                                       'assets/logo.png',
//                                       height: ScreenUtil().setSp(175),
//                                       width: ScreenUtil().setSp(175),
//                                     ),
//                                   ),
//                                   OurSizedBox(),
//                                   Text(
//                                     "Something went wrong",
//                                     style: TextStyle(
//                                       color: darkLogoColor,
//                                       fontSize: ScreenUtil().setSp(22.5),
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             }
//                           })
//                       : OurProductGridLoadingScreen(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
