import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  final TabController tabController;

  TabView({
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height / 9);
    return TabBarView(
        // physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          // Container(
          //   margin: EdgeInsets.symmetric(
          //     horizontal: ScreenUtil().setSp(10),
          //   ),
          //   child: GridView.builder(
          //     padding: EdgeInsets.zero,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 4,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: ScreenUtil().setSp(5),
          //       mainAxisSpacing: ScreenUtil().setSp(5),
          //       childAspectRatio: 0.69,
          //     ),
          //     itemBuilder: (context, index) {
          //       // ProductModel productModel =
          //       //     ProductModel.fromMap(snapshot.data!.docs[index]);
          //       return OurProductGridTile();
          //     },
          //   ),
          // ),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          // Container(
          //   margin: EdgeInsets.symmetric(
          //     horizontal: ScreenUtil().setSp(10),
          //   ),
          //   child: GridView.builder(
          //     padding: EdgeInsets.zero,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 4,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: ScreenUtil().setSp(5),
          //       mainAxisSpacing: ScreenUtil().setSp(5),
          //       childAspectRatio: 0.69,
          //     ),
          //     itemBuilder: (context, index) {
          //       // ProductModel productModel =
          //       //     ProductModel.fromMap(snapshot.data!.docs[index]);
          //       return OurProductGridTile();
          //     },
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.symmetric(
          //     horizontal: ScreenUtil().setSp(10),
          //   ),
          //   child: GridView.builder(
          //     padding: EdgeInsets.zero,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 4,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: ScreenUtil().setSp(5),
          //       mainAxisSpacing: ScreenUtil().setSp(5),
          //       childAspectRatio: 0.69,
          //     ),
          //     itemBuilder: (context, index) {
          //       // ProductModel productModel =
          //       //     ProductModel.fromMap(snapshot.data!.docs[index]);
          //       return OurProductGridTile();
          //     },
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.symmetric(
          //     horizontal: ScreenUtil().setSp(10),
          //   ),
          //   child: GridView.builder(
          //     padding: EdgeInsets.zero,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 4,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: ScreenUtil().setSp(5),
          //       mainAxisSpacing: ScreenUtil().setSp(5),
          //       childAspectRatio: 0.69,
          //     ),
          //     itemBuilder: (context, index) {
          //       // ProductModel productModel =
          //       //     ProductModel.fromMap(snapshot.data!.docs[index]);
          //       return OurProductGridTile();
          //     },
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.symmetric(
          //     horizontal: ScreenUtil().setSp(10),
          //   ),
          //   child: GridView.builder(
          //     padding: EdgeInsets.zero,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 4,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: ScreenUtil().setSp(5),
          //       mainAxisSpacing: ScreenUtil().setSp(5),
          //       childAspectRatio: 0.69,
          //     ),
          //     itemBuilder: (context, index) {
          //       // ProductModel productModel =
          //       //     ProductModel.fromMap(snapshot.data!.docs[index]);
          //       return OurProductGridTile();
          //     },
          //   ),
          // ),
        ]);
  }
}
