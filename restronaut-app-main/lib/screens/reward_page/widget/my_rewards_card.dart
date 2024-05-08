import 'package:flutter/material.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.lineDivider),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          16.verticalSpacer,
          Row(
            children: [
              Image.asset(AppImages.badgeImage.path),
              40.horizontalSpacer,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Frosted Lemonade',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  4.verticalSpacer,
                  Text(
                    ' Enjoy this reward, on us.',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
          20.verticalSpacer,
          Image.asset(AppImages.burger.path),
          20.verticalSpacer,
          Container(
              width: 326,
              child:
                  ElevatedButton(onPressed: () {}, child: Text('Add to Cart'))),
          19.verticalSpacer,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rules and Faq",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
              Text(
                'Expires 2 days',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          16.verticalSpacer,
        ],
      ),
    );
  }
}
