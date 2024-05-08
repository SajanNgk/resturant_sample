import 'package:hyperce/utils/images.dart';

class ResturantsModel {
  final String name;
  final String location;
  final String image;
  final String lattitude;
  final String longitude;

  ResturantsModel({
    required this.name,
    required this.image,
    required this.location,
    required this.lattitude,
    required this.longitude,
  });
  static List<ResturantsModel> resturants = [
    ResturantsModel(
      location: '6676 Ridge Rd, OH',
      name: 'Las Colinas',
      image: AppImages.picadillyPLogo.path,
      lattitude: '32.89287059456767',
      longitude: '-96.96642812214303',
    ),
    ResturantsModel(
      location: '6676 Ridge Rd, OH',
      name: 'Las Colinas',
      image: AppImages.picadillyPLogo.path,
      lattitude: '32.893',
      longitude: ' -96.966',
    ),
  ];
}
