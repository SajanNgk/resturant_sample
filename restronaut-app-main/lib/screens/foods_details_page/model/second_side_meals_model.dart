import 'package:hyperce/utils/images.dart';

class SecondSideMealsModel {
  final String foodName;
  final String image;
  final String price;
  final String calories;
  bool isSelected;
  SecondSideMealsModel({
    required this.price,
    required this.image,
    required this.foodName,
    required this.calories,
    this.isSelected = false,
  });
  static List<SecondSideMealsModel> secondSideMeals = [
    SecondSideMealsModel(
      foodName: 'Second side 1',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    SecondSideMealsModel(
      foodName: 'Second side 2',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    SecondSideMealsModel(
      foodName: 'Second side 3',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    SecondSideMealsModel(
      foodName: 'Second side 4',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
  ];
}
