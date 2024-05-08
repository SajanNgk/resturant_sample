import 'package:hyperce/utils/images.dart';

class BeverageModel {
  final String foodName;
  final String image;
  final String price;
  final String calories;
  bool isSelected;

  BeverageModel({
    required this.price,
    required this.image,
    required this.foodName,
    required this.calories,
    this.isSelected = false,
  });
  static List<BeverageModel> beverage = [
    BeverageModel(
      foodName: 'Beverage 1',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    BeverageModel(
      foodName: 'Beverage 2',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    BeverageModel(
      foodName: 'Beverage 3',
      image: AppImages.foods.path,
      price: '1',
      calories: '1',
      isSelected: false,
    ),
    BeverageModel(
      foodName: 'Beverage 4',
      image: AppImages.veggie.path,
      price: '1',
      calories: '1',
      isSelected: false,
    )
  ];
}
