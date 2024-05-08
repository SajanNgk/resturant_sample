import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/home_page/home_page.dart';
import 'package:hyperce/screens/payment_option/payment_option.dart';
import 'package:hyperce/screens/reward_page/reward_page.dart';
import 'package:hyperce/sidebar/orders.dart';
import 'package:hyperce/sidebar/profile.dart';
import 'package:hyperce/sidebar/shipping_adress.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              30.verticalSpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(HomePage());
                    },
                    child: Image.asset(
                      AppImages.backIcon.path,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 57,
                          child: Image.asset(
                            AppImages.piccadilly.path,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              36.verticalSpacer,
              _buildListTile(
                  title: "My Account",
                  onTap: () {
                    Get.to(Profile());
                  }),
              _buildListTile(
                title: 'My Orders',
                onTap: () {
                  Get.to(OrderPage());
                },
              ),
              _buildListTile(
                  title: 'Shipping addresses',
                  onTap: () {
                    Get.to(ShippingAddress());
                  }),
              _buildListTile(
                  title: 'Payment methods',
                  onTap: () {
                    Get.to(PaymentOption());
                  }),
              _buildListTile(
                  title: 'Rewards',
                  onTap: () {
                    Get.to(RewardsPage());
                  }),
              _buildListTile(title: 'My Feedback', onTap: () {}),
              _buildListTile(title: 'Settings', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    required Function onTap,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
        ),
      ),
      trailing: Image.asset(
        AppImages.rightArrow.path,
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
