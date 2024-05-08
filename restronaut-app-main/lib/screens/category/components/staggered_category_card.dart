import 'package:cached_network_image/cached_network_image.dart';
import 'package:hyperce/models/our_category_model.dart';
import 'package:hyperce/screens/category/category_product_screen.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class CategoryCard extends StatelessWidget {
  final Color begin;
  final Color end;
  final String categoryName;
  final String assetPath;
  final CategoryModel categoryModel;

  CategoryCard({
    required this.controller,
    required this.begin,
    required this.end,
    required this.categoryName,
    required this.assetPath,
    required this.categoryModel,
  })  : height = Tween<double>(begin: 150, end: 250.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.300,
              curve: Curves.ease,
            ),
          ),
        ),
        itemHeight = Tween<double>(begin: 0, end: 150.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.300,
              curve: Curves.ease,
            ),
          ),
        );

  final Animation<double> controller;
  final Animation<double> height;
  final Animation<double> itemHeight;

  // This function is called each time the controller "ticks" a new frame.
  // When it runs, all of the animation's values will have been
  // updated to reflect the controller's current value.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtil().setSp(7.5),
        horizontal: ScreenUtil().setSp(5),
      ),
      height: height.value,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [begin, end],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.all(
          Radius.circular(
            ScreenUtil().setSp(12.5),
          ),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment(-1, 0),
                child: Text(
                  categoryName,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.5),
                      color: darkLogoColor,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              //        mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setSp(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    margin: EdgeInsets.only(
                      bottom: ScreenUtil().setSp(5),
                    ),
                    height: itemHeight.value,
                    child: CachedNetworkImage(
                      imageUrl: assetPath,

                      // Image.network(
                      placeholder: (context, url) => Image.asset(
                        "assets/profile_holder.png",
                      ),
                      height: ScreenUtil().setSp(240),
                      width: ScreenUtil().setSp(240),
                      fit: BoxFit.cover,
                      //   )
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    print("Button Pressed");
                    print(categoryModel.id);
                    // print(categoryModel.slug);
                    // await GraphQLService().getcategorybasedproduct(
                    //     int.parse(categoryModel.id ?? ""),
                    //     categoryModel.slug ?? "");
                    FocusScope.of(context).unfocus();

                    Navigator.push(
                      context,
                      PageTransition(
                        child: CategoryProductScreen(
                            categoryName: categoryName,
                            categoryId: categoryModel.id ?? "",
                            categorySlug: categoryModel.slug ?? ""),
                        type: PageTransitionType.leftToRight,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          ScreenUtil().setSp(10),
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'View more',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12.5),
                          color: darkLogoColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggeredCardCard extends StatefulWidget {
  final Color begin;
  final Color end;
  final String categoryName;
  final String assetPath;
  final CategoryModel categoryModel;

  const StaggeredCardCard({
    required this.begin,
    required this.end,
    required this.categoryName,
    required this.assetPath,
    required this.categoryModel,
  });

  @override
  _StaggeredCardCardState createState() => _StaggeredCardCardState();
}

class _StaggeredCardCardState extends State<StaggeredCardCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isActive = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Future<void> _reverseAnimation() async {
    try {
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    var timeDilation = 10.0; // 1.0 is normal animation speed.
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isActive) {
          isActive = !isActive;
          _reverseAnimation();
        } else {
          isActive = !isActive;
          _playAnimation();
        }
      },
      child: CategoryCard(
        categoryModel: widget.categoryModel,
        controller: _controller.view,
        categoryName: widget.categoryName,
        begin: widget.begin,
        end: widget.end,
        assetPath: widget.assetPath,
      ),
    );
  }
}
