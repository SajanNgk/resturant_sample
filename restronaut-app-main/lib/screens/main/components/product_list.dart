// import 'package:card_swiper/card_swiper.dart';
// import 'package:hyperce/constants/app_constants.dart';
// import 'package:hyperce/models/model.dart';

// import 'package:hyperce/screens/product/product_page.dart';
// import 'package:hyperce/constants/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ProductList extends StatelessWidget {
//   List<ProductModel> products;

//   final SwiperController swiperController = SwiperController();

//   ProductList({required this.products});

//   @override
//   Widget build(BuildContext context) {
//     double cardHeight = MediaQuery.of(context).size.height / 2.7;
//     double cardWidth = MediaQuery.of(context).size.width / 1.8;

//     return SizedBox(
//       height: cardHeight,
//       child: Swiper(
//         itemCount: products.length,
//         itemBuilder: (_, index) {
//           return ProductCard(
//               height: cardHeight, width: cardWidth, product: products[index]);
//         },
//         scale: 0.8,
//         controller: swiperController,
//         viewportFraction: 0.6,
//         loop: false,
//         fade: 0.5,
//         pagination: SwiperCustomPagination(
//           builder: (context, config) {
//             if (config.itemCount > 20) {
//               print(
//                   "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
//             }
//             Color activeColor = mediumYellow;
//             Color color = Colors.grey.withOpacity(.3);
//             double size = ScreenUtil().setSp(10);
//             double space = ScreenUtil().setSp(5);

//             if (config.indicatorLayout != PageIndicatorLayout.NONE &&
//                 config.layout == SwiperLayout.DEFAULT) {
//               return new PageIndicator(
//                 count: config.itemCount,
//                 controller: config.pageController!,
//                 layout: config.indicatorLayout,
//                 size: size,
//                 activeColor: activeColor,
//                 color: color,
//                 space: space,
//               );
//             }

//             List<Widget> dots = [];

//             int itemCount = config.itemCount;
//             int activeIndex = config.activeIndex;

//             for (int i = 0; i < itemCount; ++i) {
//               bool active = i == activeIndex;
//               dots.add(Container(
//                 key: Key("pagination_$i"),
//                 margin: EdgeInsets.all(space),
//                 child: ClipOval(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: active ? activeColor : color,
//                     ),
//                     width: size,
//                     height: size,
//                   ),
//                 ),
//               ));
//             }

//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: dots,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final ProductModel product;
//   final double height;
//   final double width;

//   const ProductCard({
//     required this.product,
//     required this.height,
//     required this.width,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Asset asset = Asset();
//     return InkWell(
//       onTap: () => Navigator.of(context).push(
//         MaterialPageRoute(builder: (_) => Product_Page(product: product)),
//       ),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             margin: const EdgeInsets.only(left: 30),
//             height: height,
//             width: width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(24)),
//               color: Colors.grey.shade100,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 IconButton(
//                   icon: Icon(
//                     Icons.favorite_border,
//                   ),
//                   onPressed: () {},
//                   color: darkLogoColor,
//                   iconSize: ScreenUtil().setSp(22.5),
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           product.name,
//                           style: TextStyle(
//                             color: darkLogoColor,
//                             fontSize: ScreenUtil().setSp(16.5),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         margin: const EdgeInsets.only(bottom: 12.0),
//                         padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             bottomLeft: Radius.circular(10),
//                           ),
//                           color: Color.fromRGBO(224, 69, 10, 1),
//                         ),
//                         child: Text(
//                           '${product.price.price}',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             child: Hero(
//               tag: product.name,
//               child: Image.network(
//                 product.preview.source.toString(),
//                 height: height / 1.7,
//                 width: width / 1.4,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
