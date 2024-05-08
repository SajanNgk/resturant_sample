// //         colors: [
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:hive/hive.dart';
// import 'package:hyperce/utils/images.dart';

// class Product_Page extends StatefulWidget {
//   const Product_Page({super.key});

//   @override
//   State<Product_Page> createState() => _Product_PageState();
// }

// class _Product_PageState extends State<Product_Page> {
//   String dropdownvalue = "Picadilly Sauce";
//   var items = [
//     'Picadilly Sauce',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//     'Item 5',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     print("height is" + height.toString());
//     print("width is" + width.toString());
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Color(0xffF8F7E1),
//           body: Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 35,
//                       width: 50,
//                       child: IconButton(
//                         icon: Icon(Icons.arrow_back_ios),
//                         iconSize: 20,
//                         color: Colors.black,
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 255, 253, 253),
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.6),
//                             spreadRadius: -6,
//                             offset: Offset(8, 8),
//                             blurRadius: 20,
//                           )
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Entrees",
//                             style: TextStyle(
//                               fontFamily: "GeneralSans",
//                               fontWeight: FontWeight.w700,
//                               fontSize: 18,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(
//                   thickness: 1,
//                   height: 20,
//                   color: Colors.black,
//                 ),
//                 16.horizontalSpace,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 25.0, vertical: 16),
//                   child: Container(
//                     height: 500,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           width: 1,
//                           color: const Color.fromARGB(172, 79, 53, 1)),
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 5.0, vertical: 5.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset(
//                             AppImages.food.path,
//                             fit: BoxFit.cover,
//                             height: 104,
//                             width: double.infinity,
//                           ),
//                           06.verticalSpacer,
//                           Center(
//                             child: Text(
//                               "Fried Shrimps (6pcs)",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontFamily: "GeneralSans",
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                           06.verticalSpacer,
//                           Text(
//                             "Options_2options_1",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: "GeneralSans",
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           06.verticalSpacer,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 4.5),
//                                   child: Text("6pcs"),
//                                 ),
//                               ),
//                               02.horizontalSpace,
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 4.5),
//                                   child: Text("12pcs"),
//                                 ),
//                               ),
//                               02.horizontalSpace,
//                               ElevatedButton(
//                                 onPressed: () {},
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 4.5),
//                                   child: Text("18pcs"),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           06.verticalSpacer,
//                           Text(
//                             "Choice of Sauces",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: "GeneralSans",
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           06.verticalSpacer,
//                           DropdownButton(
//                             underline: Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: Colors.white,
//                                 ),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(5.0)),
//                               ),
//                             ),
//                             padding: EdgeInsets.symmetric(horizontal: 8.0),
//                             isExpanded: true,
//                             borderRadius: BorderRadius.circular(10),
//                             value: dropdownvalue,
//                             icon: const Icon(Icons.keyboard_arrow_down),
//                             items: items.map((String items) {
//                               return DropdownMenuItem(
//                                 value: items,
//                                 child: Text(items),
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 dropdownvalue = newValue!;
//                               });
//                             },
//                           ),
//                           06.verticalSpacer,
//                           Text(
//                             "Bread",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: "GeneralSans",
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           06.verticalSpacer,
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 4.0),
//                             child: Container(
//                               color: Colors.pink,
//                               height: width / 5.34,
//                               width: width / 1.12,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     height: width / 5.34,
//                                     width: width / 5,
//                                     // width: double.infinity / 4.5,
//                                     color: Colors.red,
//                                   ),
//                                   2.h.horizontalSpace,
//                                   Container(
//                                     height: width / 5.34, width: width / 5,
//                                     // width: double.infinity / 5,
//                                     color: Colors.green,
//                                   ),
//                                   2.h.horizontalSpace,
//                                   Container(
//                                     height: width / 5.34, width: width / 5,
//                                     // width: double.infinity / 5,
//                                     color: Colors.blue,
//                                   ),
//                                   2.h.horizontalSpace,
//                                   Container(
//                                     height: width / 5.34, width: width / 5,
//                                     // width: double.infinity / 4,
//                                     color: Colors.purple,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),17
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class Product_Page extends StatefulWidget {
  const Product_Page({super.key});

  @override
  State<Product_Page> createState() => _Product_PageState();
}

class _Product_PageState extends State<Product_Page> {
  String dropdownvalue = "1 Box";
  // List<String> items = ["1 Box", "2 Box"];
  //
  List<String> options_1 = [
    'Pesto Turkey Panini',
    'Chicken Bacon Club Panini',
    'Caprese Panini 1',
    'Caprese Panini 2',
  ];
  //
  List<String> options_2 = [
    'Jalapeno Chips',
    'Lay’s Original Chips',
  ];
  //
  List<String> options_3 = [
    'Bottled Water',
    'Coke',
    "Diet Coke",
    "Sprite",
  ];
//.
  List<String> options_4 = [
    '0 Vegeterian',
    '1 Vegeterian',
    "2 Vegeterian",
    "3 Vegeterian",
    "4 Vegeterian",
  ];
  //
  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;
  String? _selectedOption4;
  //
  String? _selectedOption = '1 Box';
  //
  List<String> options = [
    '1 Box',
    '2 Box',
  ]; // Define the items as variables

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            AppImages.crossIcon.path,
                            height: 40,
                            width: 40,
                            color: Colors.black,
                          )),
                      IconButton(
                        icon: Icon(Icons.card_travel),
                        iconSize: 32,
                        onPressed: () {
                          // Get.to(
                          //   CardPage(),
                          // );
                        },
                      )
                    ],
                  ),
                ),
                06.h.verticalSpacer,
                Image.asset(
                  AppImages.lunchBox.path,
                  fit: BoxFit.contain,
                ),
                08.h.verticalSpacer,
                Center(
                  child: Text(
                    "Panini Boxed Lunch",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                4.h.verticalSpacer,
                Center(
                  child: Text(
                    "Rs 12.99 / person",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                4.h.verticalSpacer,
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 1.0),
                        child: Text(
                          "Individual Packaging",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 08,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                ),
                10.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Each box includes your choice of panini, your choice of chips, cookie, and your choice of beverage.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                12.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Select Quantity:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                12.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedOption,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      iconSize: 24,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                      items:
                          options.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                12.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Select Panini :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                8.h.verticalSpacer,
                ...options_1.map((option) {
                  return RadioListTile(
                    activeColor: Color.fromARGB(255, 0, 0, 0),
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    value: option,
                    groupValue: _selectedOption1,
                    onChanged: (value) {
                      setState(() {});
                      _selectedOption1 = value;
                      print(_selectedOption1);
                    },
                  );
                }).toList(),
                8.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Select Chips :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                4.h.verticalSpacer,
                ...options_2.map((option) {
                  return RadioListTile(
                    activeColor: Color.fromARGB(255, 0, 0, 0),
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      option,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    value: option,
                    groupValue: _selectedOption2,
                    onChanged: (value) {
                      setState(() {});
                      _selectedOption2 = value;
                      print(_selectedOption2);
                    },
                  );
                }).toList(),
                8.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Select Drinks :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                4.h.verticalSpacer,
                ...options_3.map((option) {
                  return RadioListTile(
                    activeColor: Color.fromARGB(255, 0, 0, 0),
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    value: option,
                    groupValue: _selectedOption3,
                    onChanged: (value) {
                      setState(() {});
                      _selectedOption3 = value;
                      print(_selectedOption3);
                    },
                  );
                }).toList(),
                // My Group Includes:
                6.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "My Group Includes:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ...options_4.map((option) {
                  return RadioListTile(
                    activeColor: Color.fromARGB(255, 0, 0, 0),
                    contentPadding: EdgeInsets.all(0),
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    value: option,
                    groupValue: _selectedOption4,
                    onChanged: (value) {
                      setState(() {});
                      _selectedOption4 = value;
                      print(_selectedOption4);
                    },
                  );
                }).toList(),
                6.h.verticalSpacer,
                //Add Special Instructions:
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Add Special Instructions:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                8.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                10.h.verticalSpacer,
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 08.0, horizontal: 40.0),
                      child: Text("Add to Cart"),
                    ),
                  ),
                ),
                20.h.verticalSpacer,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
