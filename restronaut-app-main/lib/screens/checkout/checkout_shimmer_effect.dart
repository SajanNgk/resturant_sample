import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/our_sized_box.dart';

class CheckOutShimmerWidget extends StatefulWidget {
  const CheckOutShimmerWidget({super.key});

  @override
  State<CheckOutShimmerWidget> createState() => _CheckOutShimmerWidgetState();
}

class _CheckOutShimmerWidgetState extends State<CheckOutShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey.shade300.withOpacity(0.4),
            height: ScreenUtil().setSp(150),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
              vertical: ScreenUtil().setSp(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(10),
              vertical: ScreenUtil().setSp(10),
            ),
            child: Shimmer.fromColors(
              period: const Duration(seconds: 1),
              highlightColor: Colors.grey.shade200,
              baseColor: Colors.grey.shade500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: ScreenUtil().setSp(75),
                        height: ScreenUtil().setSp(75),
                        decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            // shape: shapeBorder,
                            shape: RoundedRectangleBorder()),
                      ),
                      OurSizedBox(),
                      Container(
                        width: ScreenUtil().setSp(25),
                        height: ScreenUtil().setSp(10),
                        decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            // shape: shapeBorder,
                            shape: RoundedRectangleBorder()),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: ScreenUtil().setSp(150),
                        height: ScreenUtil().setSp(10),
                        decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            shape: RoundedRectangleBorder()),
                      ),
                      OurSizedBox(),
                      Container(
                        width: ScreenUtil().setSp(75),
                        height: ScreenUtil().setSp(10),
                        decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            shape: RoundedRectangleBorder()),
                      ),
                    ],
                  ),
                  Column(
                    // mainAxisAlignment:
                    //     MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: ScreenUtil().setSp(25),
                            height: ScreenUtil().setSp(25),
                            decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                // shape: shapeBorder,
                                shape: RoundedRectangleBorder()),
                          ),
                          SizedBox(
                            width: ScreenUtil().setSp(12.5),
                          ),
                          Container(
                            width: ScreenUtil().setSp(25),
                            height: ScreenUtil().setSp(25),
                            decoration: ShapeDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                // shape: shapeBorder,
                                shape: RoundedRectangleBorder()),
                          ),
                        ],
                      ),
                      OurSizedBox(),
                      Container(
                        width: ScreenUtil().setSp(25),
                        height: ScreenUtil().setSp(25),
                        decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            // shape: shapeBorder,
                            shape: RoundedRectangleBorder()),
                      ),
                      // Container(
                      //   width: ScreenUtil().setSp(25),
                      //   height: ScreenUtil().setSp(10),
                      //   decoration: ShapeDecoration(
                      //       color: Colors.grey
                      //           .withOpacity(0.3),
                      //       // shape: shapeBorder,
                      //       shape:
                      //           RoundedRectangleBorder()),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
