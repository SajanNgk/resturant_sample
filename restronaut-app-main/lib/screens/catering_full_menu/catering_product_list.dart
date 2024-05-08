import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/menu_page/model/full_menu.dart';
import 'package:hyperce/screens/my_cart/my_cart.dart';
import 'package:hyperce/screens/product/product_page.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class CateringFoodDetailsPage extends StatefulWidget {
  final String foodName;
  final String price;
  final String calories;
  const CateringFoodDetailsPage(
      {super.key,
      required this.foodName,
      required this.price,
      required this.calories});

  @override
  State<CateringFoodDetailsPage> createState() =>
      _CateringFoodDetailsPageState();
}

class _CateringFoodDetailsPageState extends State<CateringFoodDetailsPage> {
  String? foodSelectedSize = 'small';
  String? sidesSelectedSize = 'small';
  static List<FullMenu> CateringProductList = [
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
    // FullMenu(
    //     foodName: 'Chicken Tenders',
    //     price: '1',
    //     image: AppImages.entrees.path,
    //     calories: '2'),
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
                        color: AppColors.mainColor,
                        fontSize: 18,
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
                      // padding: EdgeInsets.symmetric(horizontal: 12.0),
                      itemBuilder: (context, index) {
                        return _buildMenuFoodContainer(
                            CateringProductList[index]);
                        //         Container(
                        //           child: Image.asset(
                        //  fullFoodMenu.l!
                        //             // ![index],
                        //             fit: BoxFit.fill,
                        //           ),
                        //           decoration: BoxDecoration(
                        //             color: Colors.green,
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //         );
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
                Get.to(Product_Page());
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
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.mainColor,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 9.5, vertical: 2),
                      child: Text(
                        'Individual Packaging',
                        style: TextStyle(
                          fontSize: 6,
                        ),
                      ),
                    ),
                    4.verticalSpacer,
                    Text(
                      '\$12.99 / person',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ]),
              // onTap: () {
              //   Get.to(CateringFoodDetailsPage(
              //       foodName: fullFoodMenu.foodName,
              //       price: fullFoodMenu.price,
              //       calories: fullFoodMenu.calories));

              //   // FoodDetailsPage(
              //   //   foodName: fullFoodMenu.foodName,
              //   //   price: fullFoodMenu.price,
              //   //   calories: fullFoodMenu.calories)
              // },
            ),
          ],
        ),
      ],
    );
  }
}
