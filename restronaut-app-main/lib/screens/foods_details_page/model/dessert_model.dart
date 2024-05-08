import 'package:hyperce/utils/images.dart';

class DessertModel {
  final String foodName;
  final String image;
  final String price;
  final String calories;
  bool isSelected;

  DessertModel({
    required this.price,
    required this.image,
    required this.foodName,
    required this.calories,
    this.isSelected = false,
  });
  static List<DessertModel> dessertMeals = [
    DessertModel(
      foodName: 'dessert 1',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    DessertModel(
      foodName: 'dessert 2',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    DessertModel(
      foodName: 'dessert 3',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    DessertModel(
      foodName: 'dessert 4',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    )
  ];
}
