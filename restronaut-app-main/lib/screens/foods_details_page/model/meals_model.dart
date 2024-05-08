import 'package:hyperce/utils/images.dart';

class FirstSideMealsModel {
  final String foodName;
  final String image;
  final String price;
  final String calories;
  bool isSelected;

  FirstSideMealsModel({
    required this.price,
    required this.image,
    required this.foodName,
    required this.calories,
    this.isSelected = false,
  });
  static List<FirstSideMealsModel> firstSidemeals = [
    FirstSideMealsModel(
      foodName: 'First side 1',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    FirstSideMealsModel(
      foodName: 'First side 2',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    FirstSideMealsModel(
      foodName: 'First side 3',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    FirstSideMealsModel(
      foodName: 'First side 4',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
  ];
}
