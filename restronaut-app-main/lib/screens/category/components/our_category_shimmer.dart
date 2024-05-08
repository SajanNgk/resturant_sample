import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OurCategoryShimmer extends StatefulWidget {
  const OurCategoryShimmer({super.key});

  @override
  State<OurCategoryShimmer> createState() => _OurCategoryShimmerState();
}

class _OurCategoryShimmerState extends State<OurCategoryShimmer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                Container(
                  width: ScreenUtil().setSp(150),
                  height: ScreenUtil().setSp(10),
                  decoration: ShapeDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: RoundedRectangleBorder()),
                ),
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
                )
              ],
            ),
          ),
        ),
        Container(
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
                Container(
                  width: ScreenUtil().setSp(150),
                  height: ScreenUtil().setSp(10),
                  decoration: ShapeDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      // shape: shapeBorder,
                      shape: RoundedRectangleBorder()),
                ),
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
                )
              ],
            ),
          ),
        ),
        Container(
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
                Container(
                  width: ScreenUtil().setSp(150),
                  height: ScreenUtil().setSp(10),
                  decoration: ShapeDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      // shape: shapeBorder,
                      shape: RoundedRectangleBorder()),
                ),
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
