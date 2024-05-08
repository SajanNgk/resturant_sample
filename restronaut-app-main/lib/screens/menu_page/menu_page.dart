import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyperce/constants/app_colors.dart';
import 'package:hyperce/screens/menu_page/food_inside_category.dart';
import 'package:hyperce/screens/menu_page/model/favourites.dart';
import 'package:hyperce/screens/menu_page/model/full_menu.dart';
import 'package:hyperce/screens/menu_page/model/recent_food.dart';
import 'package:hyperce/utils/extensions/num_extensions.dart';
import 'package:hyperce/utils/images.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  final tabs = ['Recents', 'Full Menu', 'Favourites'];
  static List<RecentFood> recentFoods = [
    RecentFood(
        foodName: 'Burger',
        price: '1',
        image: AppImages.burgerMenu.path,
        calories: '2'),
    RecentFood(
        foodName: 'Cheese Cake',
        price: '1',
        image: AppImages.cheeseCake.path,
        calories: '2'),
    RecentFood(
        foodName: 'Coffee',
        price: '1',
        image: AppImages.coffeeMenu.path,
        calories: '2'),
    RecentFood(
        foodName: 'Cheese Cake',
        price: '1',
        image: AppImages.cake.path,
        calories: '2'),
    RecentFood(
        foodName: 'drinks',
        price: '1',
        image: AppImages.drinks.path,
        calories: '2'),
    RecentFood(
        foodName: 'salads',
        price: '1',
        image: AppImages.salads.path,
        calories: '2'),
  ];
  static List<FullMenu> fullFoodMenu = [
    FullMenu(
        foodName: 'ENTREES',
        price: '1',
        image: AppImages.burgerMenu.path,
        calories: '2'),
    FullMenu(
        foodName: 'VEGETABLES',
        price: '1',
        image: AppImages.vegetable.path,
        calories: '2'),
    FullMenu(
        foodName: 'DESSERTS',
        price: '1',
        image: AppImages.dessert.path,
        calories: '2'),
    FullMenu(
        foodName: 'BEVERAGES',
        price: '1',
        image: AppImages.beverages.path,
        calories: '2'),
    FullMenu(
        foodName: ' FAMILY PACKS',
        price: '1',
        image: AppImages.familyPack.path,
        calories: '2'),
  ];
  static List<Favourites> favouritesFood = [
    Favourites(
        foodName: 'Burger',
        price: '1',
        image: AppImages.burgerMenu.path,
        calories: '2'),
    Favourites(
        foodName: 'Cheese Cake',
        price: '1',
        image: AppImages.cheeseCake.path,
        calories: '2'),
    Favourites(
        foodName: 'Coffee',
        price: '1',
        image: AppImages.coffeeMenu.path,
        calories: '2'),
    Favourites(
        foodName: 'Cheese Cake',
        price: '1',
        image: AppImages.cake.path,
        calories: '2'),
    Favourites(
        foodName: 'drinks',
        price: '1',
        image: AppImages.drinks.path,
        calories: '2'),
    Favourites(
        foodName: 'salads',
        price: '1',
        image: AppImages.salads.path,
        calories: '2'),
  ];
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
          leading: null,
          toolbarHeight: 100,
          title: Column(
            children: [
              Container(
                height: 20,
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.backGroundImage.path,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        50.horizontalSpacer,
                        Text(
                          "select a resturant",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            child: Image.asset(AppImages.storeLogo.path)),
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                controller: _tabController,
                tabs: tabs
                    .map(
                      (e) => Tab(
                        text: e,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              _buildRecentPage(),
              _buildMenuPage(),
              _buildFavouritesPage()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentPage() {
    return Column(
      children: [
        ListView.builder(
          itemCount: recentFoods.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildRecentFoodContainer(recentFoods[index]);
          },
        ),
      ],
    );
  }

  Widget _buildRecentFoodContainer(RecentFood recentFood) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpacer,
        Row(
          children: [
            Image.asset(recentFood.image),
            20.horizontalSpacer,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recentFood.foodName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildMenuPage() {
    return Column(
      children: [
        ListView.builder(
          itemCount: fullFoodMenu.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildMenuFoodContainer(fullFoodMenu[index]);
          },
        ),
      ],
    );
  }

  Widget _buildFavouritesPage() {
    return Column(
      children: [
        ListView.builder(
          itemCount: favouritesFood.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildFavouritesFoodContainer(favouritesFood[index]);
          },
        ),
      ],
    );
  }

  Widget _buildFavouritesFoodContainer(Favourites favouritesFoods) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpacer,
            Row(
              children: [
                Image.asset(favouritesFoods.image),
                20.horizontalSpacer,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favouritesFoods.foodName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Image.asset(AppImages.favouritesIcon.path)
      ],
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
              child: Row(children: [
                Image.asset(fullFoodMenu.image),
                30.horizontalSpacer,
                Text(
                  fullFoodMenu.foodName,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ]),
              onTap: () {
                Get.to(FoodInsideCategory(
                    foodName: fullFoodMenu.foodName,
                    price: fullFoodMenu.price,
                    calories: fullFoodMenu.calories));
              },
            ),
          ],
        ),
      ],
    );
  }
}
