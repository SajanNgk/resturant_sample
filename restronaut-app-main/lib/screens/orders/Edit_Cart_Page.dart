import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyperce/screens/home_page/model/circular_food_container.dart';
import 'package:get/get.dart';
import 'package:hyperce/screens/checkout_page/checkout_page.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class Edit_Cart_Page extends StatefulWidget {
  const Edit_Cart_Page({
    super.key,
  });
  @override
  State<Edit_Cart_Page> createState() => _Edit_Cart_PageState();
}

class _Edit_Cart_PageState extends State<Edit_Cart_Page> {
  List<RegularFoodsModel> orderedFood = [
    RegularFoodsModel(
        price: '1.4',
        image: AppImages.chickenWrap.path,
        foodName: "Chicken Wrap"),
    RegularFoodsModel(
        price: "4", image: AppImages.pizza.path, foodName: "Pizza"),
    RegularFoodsModel(
        price: "2", image: AppImages.burger.path, foodName: "Burger"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icons/icons-cross.png",
                      width: 40,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "McDonald's",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "ED Garamond",
                          fontSize: 16),
                    ),
                    __buildContainer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CupertinoButton(
                        pressedOpacity: 0.5,
                        borderRadius: BorderRadius.circular(10),
                        padding: EdgeInsets.all(10),
                        color: Color.fromARGB(255, 178, 174, 174),
                        child: Text(
                          "+ Add Item",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Divider(),
                    Text("Dunkin Donuts",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "ED Garamond",
                            fontSize: 16)),
                    __buildContainer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CupertinoButton(
                        pressedOpacity: 0.5,
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 178, 174, 174),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "+ Add Item",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "ED Garamond",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Divider(),
                    Text("Starbucks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "ED Garamond",
                            fontSize: 16)),
                    __buildContainer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CupertinoButton(
                        pressedOpacity: 0.5,
                        borderRadius: BorderRadius.circular(10),
                        padding: EdgeInsets.all(08),
                        color: Colors.grey,
                        child: Text(
                          "+ Add Item",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    20.verticalSpacer,
                    ElevatedButton(
                        onPressed: () {
                          Get.to(MyCheckoutPage());
                        },
                        child: Text('Go to checkout')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget __buildContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            final foodList = orderedFood[index];
            return Column(
              children: [
                BuildCartContainer(foodList),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget BuildCartContainer(RegularFoodsModel myfood) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              myfood.image,
            ),
            15.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.verticalSpace,
                Text(
                  myfood.foodName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(myfood.price),
                // 10.h.verticalSpacer,
              ],
            )
          ],
        ),
      ],
    );
  }
}
