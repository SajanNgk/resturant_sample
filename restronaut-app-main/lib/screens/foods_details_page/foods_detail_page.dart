import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/foods_details_page/model/beverage_model.dart';
import 'package:hyperce/screens/foods_details_page/model/bread_model.dart';
import 'package:hyperce/screens/foods_details_page/model/dessert_model.dart';
import 'package:hyperce/screens/foods_details_page/model/second_side_meals_model.dart';
import 'package:hyperce/screens/menu_page/model/full_menu.dart';
import 'package:hyperce/screens/my_cart/my_cart.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';
import 'model/meals_model.dart';

class FoodDetailsPage extends StatefulWidget {
  final FullMenu appFullMenu;
  const FoodDetailsPage({super.key, required this.appFullMenu});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  bool _isCompleted = false;

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
                      child: Icon(Icons.close)),
                  Image.asset(AppImages.storeLogo.path)
                ],
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.h.verticalSpacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _isCompleted ? Colors.white : AppColors.mainColor,
                        ),
                        child: Text(
                          'Make a meal',
                          style: TextStyle(
                            color: _isCompleted
                                ? Color.fromARGB(255, 83, 29, 15)
                                : Colors.white,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isCompleted = false;
                            print(_isCompleted);
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              _isCompleted ? AppColors.mainColor : Colors.white,
                        ),
                        child: Text(
                          'Al a Carte',
                          style: TextStyle(
                            color: _isCompleted
                                ? Colors.white
                                : Color.fromARGB(255, 83, 29, 15),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isCompleted = true;
                            print(_isCompleted);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                15.h.verticalSpacer,
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset(AppImages.food_shrimps.path),
                ),
                8.h.verticalSpacer,
                Center(
                  child: Text(
                    widget.appFullMenu.foodName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                8.h.verticalSpacer,
                Center(
                  child: Text(
                    '\$${widget.appFullMenu.price}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
                _isCompleted ? _buildAlACart() : _buildMakeAMeal(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlACart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.h.verticalSpacer,
        Text(
          "choose a dessert",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        8.verticalSpacer,
        GridView.builder(
          itemCount: FirstSideMealsModel.firstSidemeals.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemBuilder: (context, index) {
            final appDesertMeal = DessertModel.dessertMeals[index];
            return _buildDessert(appDesertMeal);
          },
        ),
        8.verticalSpacer,
        Text(
          "Choice a Beverage",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        8.verticalSpacer,
        GridView.builder(
          itemCount: FirstSideMealsModel.firstSidemeals.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemBuilder: (context, index) {
            final appBeverageModel = BeverageModel.beverage[index];
            return _buildBeverage(appBeverageModel);
          },
        ),
        41.verticalSpacer,
        Container(
          width: 350,
          child: ElevatedButton(
            onPressed: () {
              Get.to(MyCart());
            },
            child: Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        20.0.h.verticalSpacer,
      ],
    );
  }

  Widget _buildMakeAMeal() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.h.verticalSpacer,
            Text(
              'First Side',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            8.h.verticalSpacer,
            GridView.builder(
              itemCount: FirstSideMealsModel.firstSidemeals.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.5,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                final appFirstMeal = FirstSideMealsModel.firstSidemeals[index];
                return _buildFirstMeal(appFirstMeal);
              },
            ),
            8.h.verticalSpacer,
            Text(
              'Second Side',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            8.verticalSpacer,
            GridView.builder(
              itemCount: FirstSideMealsModel.firstSidemeals.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.5,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                final appSecondMeal =
                    SecondSideMealsModel.secondSideMeals[index];
                return _buildSecondMeal(appSecondMeal);
              },
            ),
            8.h.verticalSpacer,
            Text(
              'Bread',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            8.verticalSpacer,
            GridView.builder(
              itemCount: FirstSideMealsModel.firstSidemeals.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.5,
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                final appBreadMeal = BreadeMealsModel.breaedMeals[index];
                return _buildBreadMeal(appBreadMeal);
              },
            ),
          ],
        ),
        Container(
          width: 350,
          child: ElevatedButton(
            onPressed: () {
              Get.to(MyCart());
            },
            child: Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        20.0.h.verticalSpacer,
      ],
    );
  }

  Widget getWidget(int index) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: index.floor().isEven
                  ? Image.asset(
                      AppImages.desserts.path,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppImages.bread.path,
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          'Dessert ${index + 1}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        4.verticalSpacer,
        Text(
          '\$ 12',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildBeverage(BeverageModel meals) {
    return GestureDetector(
      onTap: () {
        setState(() {
          BeverageModel.beverage.forEach((item) {
            item.isSelected = item == meals;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: meals.isSelected ? AppColors.mainColor : Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(meals.image)),
            6.verticalSpacer,
            Text(
              meals.foodName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDessert(DessertModel meals) {
    return GestureDetector(
      onTap: () {
        setState(() {
          DessertModel.dessertMeals.forEach((item) {
            item.isSelected = item == meals;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: meals.isSelected ? AppColors.mainColor : Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(meals.image)),
            6.verticalSpacer,
            Text(
              meals.foodName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBreadMeal(BreadeMealsModel meals) {
    return GestureDetector(
      onTap: () {
        setState(() {
          BreadeMealsModel.breaedMeals.forEach((item) {
            item.isSelected = item == meals;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: meals.isSelected ? AppColors.mainColor : Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(meals.image)),
            6.verticalSpacer,
            Text(
              meals.foodName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstMeal(FirstSideMealsModel meals) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FirstSideMealsModel.firstSidemeals.forEach((item) {
            item.isSelected = item == meals;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: meals.isSelected ? AppColors.mainColor : Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(meals.image)),
            6.verticalSpacer,
            Text(
              meals.foodName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondMeal(SecondSideMealsModel meals) {
    return GestureDetector(
      onTap: () {
        setState(() {
          SecondSideMealsModel.secondSideMeals.forEach((item) {
            item.isSelected = item == meals;
          });
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: meals.isSelected ? AppColors.mainColor : Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(meals.image)),
            6.verticalSpacer,
            Text(
              meals.foodName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
