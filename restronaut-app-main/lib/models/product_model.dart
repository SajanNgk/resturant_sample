// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'package:hyperce/models/model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String id;
  final String name;
  final String description;
  final Asset preview;
  final ProductVariantDetail price;
  final CustomFields rating;

  /// The [title], [description], and [image] parameters are required. The [price]
  /// and [rating] parameters are optional and can be set to `null`.
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.preview,
    required this.price,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

/// we need to replace these sample products with actual product data when integrating the application
/// with real backend services or databases.
// List<ProductModel> hotDummyProducts = [
//   ProductModel(
//     image: Assets.hotDummyProducts[0],
//     title: 'Skullcandy headset L325',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 102.99,
//   ),
//   ProductModel(
//     image: Assets.hotDummyProducts[1],
//     title: 'Skullcandy headset X25',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 55.99,
//   ),
//   ProductModel(
//     image: Assets.hotDummyProducts[2],
//     title: 'Blackzy PRO hedphones M003',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 152.99,
//   ),
// ].toList();

// List<ProductModel> topSellerDummyProduct = [
//   ProductModel(
//     image: Assets.topSellerDummyProducts[0],
//     title: 'Skullcandy headset L325',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 102.99,
//   ),
//   ProductModel(
//     image: Assets.topSellerDummyProducts[1],
//     title: 'Skullcandy headset X25',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 55.99,
//   ),
//   ProductModel(
//     image: Assets.topSellerDummyProducts[2],
//     title: 'Blackzy PRO hedphones M003',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 152.99,
//   ),
// ].toList();

// List<ProductModel> topRatedDummyProducts = [
//   ProductModel(
//     image: Assets.topRatedDummyProducts[0],
//     title: 'Skullcandy headset L325',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 102.99,
//   ),
//   ProductModel(
//     image: Assets.topRatedDummyProducts[1],
//     title: 'Skullcandy headset X25',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 55.99,
//   ),
//   ProductModel(
//     image: Assets.topRatedDummyProducts[2],
//     title: 'Blackzy PRO hedphones M003',
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua. ... (truncated for brevity)',
//     price: 152.99,
//   ),
// ].toList();
