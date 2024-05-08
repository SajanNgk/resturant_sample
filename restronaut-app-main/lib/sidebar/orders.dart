import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/constants.dart';
import 'package:hyperce/utils/images.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool __isCompleted = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    log(width);

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 14,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Image.asset(AppImages.backIcon.path),
                    onTap: () {
                      Get.back();
                    },
                  ),

                  // Container(
                  //   child: IconButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     icon: Icon(
                  //       Icons.arrow_back_ios,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Color.fromARGB(255, 255, 253, 253),
                  //     shape: BoxShape.circle,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.5),
                  //         spreadRadius: -6,
                  //         offset: Offset(9, 9),
                  //         blurRadius: 20,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // 60.h.horizontalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: Text(
                      "My Orders",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              20.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      child: MaterialButton(
                        color:
                            __isCompleted ? Colors.white : AppColors.mainColor,
                        onPressed: () {
                          setState(() {
                            __isCompleted = false;
                            print(__isCompleted);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 20.0),
                          child: Text(
                            "My Order",
                            style: TextStyle(
                              color: __isCompleted
                                  ? Color.fromARGB(255, 83, 29, 15)
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 10.h.horizontalSpacer,
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      child: MaterialButton(
                        color:
                            __isCompleted ? AppColors.mainColor : Colors.white,
                        onPressed: () {
                          setState(() {
                            __isCompleted = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 20.0),
                          child: FittedBox(
                            child: Text(
                              "History",
                              style: TextStyle(
                                color: __isCompleted
                                    ? Colors.white
                                    : Color.fromARGB(255, 83, 29, 15),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                // fontFamily: "General Sans",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              (width / 35).h.verticalSpace,
              __buildWidget(width),
              (width / 35).h.verticalSpace,
              __buildWidget(width),
            ],
          ),
        ),
      )),
    );
  }

  Widget __buildWidget(double width) {
    return Container(
      height: 170,
      width: width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: width / 4.8,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 154, 111, 111),
                    borderRadius: BorderRadius.circular(06),
                  ),
                ),
                (width / 50).h.horizontalSpace,
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delinas Restro",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          8.0.h.verticalSpace,
                          Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          8.0.h.verticalSpace,
                          Text(
                            "Total",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: __isCompleted
                                    ? const Color.fromARGB(255, 18, 82, 20)
                                    : Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 1.0),
                                child: __isCompleted
                                    ? Text(
                                        "Completed",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 18, 82, 20),
                                        ),
                                      )
                                    : Text(
                                        "In Progress",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      )),
                          ),
                          8.0.h.verticalSpace,
                          Text(
                            "23 Dec 2080",
                            style: TextStyle(
                              color: Color.fromARGB(255, 65, 65, 65),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          8.0.h.verticalSpace,
                          Text(
                            "Rs 340",
                            style: TextStyle(
                              color: Color.fromARGB(255, 65, 65, 65),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 2.0),
                    child: Text("Details"),
                  ),
                ),
                // 6.0.h.horizontalSpace,
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      // top: 2.0,
                    ),
                    child: Center(child: Text("Tracking")),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
