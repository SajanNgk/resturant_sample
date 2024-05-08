// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:hyperce/constants/app_bar.dart';
// import 'package:hyperce/constants/app_colors.dart';
// import 'package:hyperce/screens/product/product_page.dart';
// import 'package:hyperce/utils/extensions/num_extensions.dart';
// import 'package:hyperce/utils/images.dart';

// class CardPage extends StatefulWidget {
//   const CardPage({super.key});

//   @override
//   State<CardPage> createState() => _CardPageState();
// }

// class _CardPageState extends State<CardPage> {
//   bool __isCompleted = false;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6.0),
//             child: Column(
//               children: [
//                 12.h.verticalSpacer,
//                 MyAppBar.getAppBar(context),
//                 12.h.verticalSpacer,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: MaterialButton(
//                         color:
//                             __isCompleted ? Colors.white : AppColors.mainColor,
//                         onPressed: () {
//                           setState(() {
//                             __isCompleted = false;
//                             print(__isCompleted);
//                           });
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 16.0),
//                           child: Text(
//                             "Make a Meal",
//                             style: TextStyle(
//                               color: __isCompleted
//                                   ? Color.fromARGB(255, 83, 29, 15)
//                                   : Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     10.h.horizontalSpacer,
//                     Expanded(
//                       child: MaterialButton(
//                         color:
//                             __isCompleted ? AppColors.mainColor : Colors.white,
//                         onPressed: () {
//                           setState(() {
//                             __isCompleted = true;
//                           });
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16.0, vertical: 16.0),
//                           child: FittedBox(
//                             child: Text(
//                               "AI a create",
//                               style: TextStyle(
//                                 color: __isCompleted
//                                     ? Colors.white
//                                     : Color.fromARGB(255, 83, 29, 15),
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700,
//                                 // fontFamily: "General Sans",
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 15.h.verticalSpacer,
//                 Image.asset(AppImages.food_shrimps.path),
//                 8.h.verticalSpacer,
//                 Text(
//                   "Fried Shrimps",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 24,
//                   ),
//                 ),
//                 Text(
//                   "Rs 10.29",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
