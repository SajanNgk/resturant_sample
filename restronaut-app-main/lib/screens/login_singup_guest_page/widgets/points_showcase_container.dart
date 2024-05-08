import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class PointShowcaseContainer extends StatelessWidget {
  final String pointsAccumulated;
  const PointShowcaseContainer({super.key, required this.pointsAccumulated});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lineDivider),
          borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          14.verticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pointsAccumulated,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text("Reward options"),
                  Image.asset(AppImages.dropDownIcon.path)
                ],
              ),
            ],
          ),
          6.h.verticalSpace,
          Text(
            'Points Accumulated',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          50.h.verticalSpacer,
        ],
      ),
    );
  }
}
