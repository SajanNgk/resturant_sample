// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createcustomer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCustomerInput _$CreateCustomerInputFromJson(Map<String, dynamic> json) =>
    CreateCustomerInput(
      title: json['title'] as String? ?? "",
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String? ?? "",
      emailAddress: json['emailAddress'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$CreateCustomerInputToJson(
        CreateCustomerInput instance) =>
    <String, dynamic>{
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
    };
