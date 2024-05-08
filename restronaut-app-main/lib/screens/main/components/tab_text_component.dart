import 'package:hyperce/controllers/our_tab_controller.dart';
import 'package:hyperce/models/our_category_model.dart';
import 'package:hyperce/screens/widgets/our_sized_box.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabTextComponent extends StatelessWidget {
  final String title;
  final int index;
  final CategoryModel categoryModel;

  const TabTextComponent({
    Key? key,
    required this.title,
    required this.index,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<OurTabController>();

    return Obx(() {
      final isSelected = tabController.index.value == index;
      return InkWell(
        onTap: () {
          Get.find<OurTabController>().changeIndex(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? goldenLogoColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                OurSizedBox(),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.white : darkgoldenLogoColor,
                    fontSize: isSelected
                        ? ScreenUtil().setSp(17.5)
                        : ScreenUtil().setSp(15),
                    fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setSp(2.5),
                ),
                Container(
                  color: isSelected ? Colors.transparent : Colors.transparent,
                  height: ScreenUtil().setSp(3),
                  width: ScreenUtil().setSp(75),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
