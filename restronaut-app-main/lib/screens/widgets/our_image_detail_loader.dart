import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OurImageDetailLoader extends StatelessWidget {
  const OurImageDetailLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300.withOpacity(0.4),
      height: MediaQuery.of(context).size.height * 0.45,
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
        child: Container(
          // color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      // return Text('data');
                      return Container(
                        decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            // shape: shapeBorder,
                            shape: RoundedRectangleBorder()),
                        height: ScreenUtil().setSp(125),
                        width: ScreenUtil().setSp(125),
                        margin: EdgeInsets.only(
                          left: ScreenUtil().setSp(7.5),
                          right: ScreenUtil().setSp(7.5),
                          bottom: ScreenUtil().setSp(7.5),
                          top: ScreenUtil().setSp(7.5),
                        ),
                      );

                      //  Text(snapshot.data![index]);
                    }),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    left: ScreenUtil().setSp(7.5),
                    right: ScreenUtil().setSp(7.5),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(17.5),
                      ),
                      child: Container(
                        decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            // shape: shapeBorder,
                            shape: RoundedRectangleBorder()),
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: ScreenUtil().setSp(125),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
