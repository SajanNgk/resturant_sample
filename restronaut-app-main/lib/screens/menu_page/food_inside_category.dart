import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/foods_details_page/foods_detail_page.dart';
import 'package:hyperce/screens/menu_page/model/full_menu.dart';
import 'package:hyperce/screens/my_cart/my_cart.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class FoodInsideCategory extends StatefulWidget {
  final String foodName;
  final String price;
  final String calories;
  const FoodInsideCategory(
      {super.key,
      required this.foodName,
      required this.price,
      required this.calories});

  @override
  State<FoodInsideCategory> createState() => _FoodInsideCategoryState();
}

class _FoodInsideCategoryState extends State<FoodInsideCategory> {
  String? foodSelectedSize = 'small';
  String? sidesSelectedSize = 'small';
  static List<FullMenu> CateringProductList = [
    FullMenu(
        foodName: 'Fried Shrimps',
        price: '1',
        image: AppImages.foodShrimpsSmall.path,
        calories: '2'),
    FullMenu(
        foodName: 'Panini Boxed Lunch',
        price: '1',
        image: AppImages.PaniniBoxedLunch.path,
        calories: '2'),
    FullMenu(
        foodName: 'Vegetable Bento Box',
        price: '1',
        image: AppImages.vegetable.path,
        calories: '2'),
    FullMenu(
        foodName: 'Vegetable Bento Box',
        price: '1',
        image: AppImages.vegetableBentoBox2.path,
        calories: '2'),
    FullMenu(
        foodName: ' Noodles Platter',
        price: '1',
        image: AppImages.noodles.path,
        calories: '2'),
  ];
  String foodDetails =
      'Our Small Black Forest Ham is a high-quality pork product, expertly cured with traditional spices\nto create a rich, smoky flavor and tender texture. Perfect for sandwiches, salads, or charcuterie\nboards, it offers a harmonious balance of robust taste and succulent juiciness, promising to\nelevate any meal';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(AppImages.backIcon.path),
                  ),
                  Text(
                    'Entrees',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Image.asset(AppImages.storeLogo.path)
                ],
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            Image.asset(AppImages.saladFullPic.path),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: SingleChildScrollView(
                child: Container(
                  height: 500,
                  child: ListView.builder(
                      itemCount: CateringProductList.length,
                      itemBuilder: (context, index) {
                        return _buildMenuFoodContainer(
                            CateringProductList[index]);
                      }),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  8.verticalSpacer,
                  8.verticalSpacer,
                  90.verticalSpacer,
                  Container(
                    width: 358,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(MyCart());
                        },
                        child: Text('Add to Cart')),
                  ),
                  20.verticalSpacer,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuFoodContainer(FullMenu fullFoodMenu) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpacer,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(FoodDetailsPage(appFullMenu: fullFoodMenu));
              },
              child: Row(children: [
                Image.asset(fullFoodMenu.image),
                30.horizontalSpacer,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullFoodMenu.foodName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    4.verticalSpacer,
                  ],
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}
