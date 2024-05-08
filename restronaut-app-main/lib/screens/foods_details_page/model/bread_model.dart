import 'package:hyperce/utils/images.dart';

class BreadeMealsModel {
  final String foodName;
  final String image;
  final String price;
  final String calories;
  bool isSelected;

  BreadeMealsModel({
    required this.price,
    required this.image,
    required this.foodName,
    required this.calories,
    this.isSelected = false,
  });
  static List<BreadeMealsModel> breaedMeals = [
    BreadeMealsModel(
      foodName: 'Bread 1',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    BreadeMealsModel(
      foodName: 'Bread 2',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    BreadeMealsModel(
      foodName: 'Bread 3',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    BreadeMealsModel(
      foodName: 'Bread 4',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    )
  ];
}
