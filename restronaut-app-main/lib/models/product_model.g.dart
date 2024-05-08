// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      preview: Asset.fromJson(json['preview'] as Map<String, dynamic>),
      price:
          ProductVariantDetail.fromJson(json['price'] as Map<String, dynamic>),
      rating: CustomFields.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'preview': instance.preview,
      'price': instance.price,
      'rating': instance.rating,
    };
