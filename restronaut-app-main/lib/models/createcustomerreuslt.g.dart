// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createcustomerreuslt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCustomerAccountResult _$RegisterCustomerAccountResultFromJson(
        Map<String, dynamic> json) =>
    RegisterCustomerAccountResult();

Map<String, dynamic> _$RegisterCustomerAccountResultToJson(
        RegisterCustomerAccountResult instance) =>
    <String, dynamic>{};

SuccessResult _$SuccessResultFromJson(Map<String, dynamic> json) =>
    SuccessResult(
      success: json['success'] as bool,
    );

Map<String, dynamic> _$SuccessResultToJson(SuccessResult instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

MissingPasswordErrorResult _$MissingPasswordErrorResultFromJson(
        Map<String, dynamic> json) =>
    MissingPasswordErrorResult(
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$MissingPasswordErrorResultToJson(
        MissingPasswordErrorResult instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
    };

PasswordValidationErrorResult _$PasswordValidationErrorResultFromJson(
        Map<String, dynamic> json) =>
    PasswordValidationErrorResult(
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$PasswordValidationErrorResultToJson(
        PasswordValidationErrorResult instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
    };

NativeAuthStrategyErrorResult _$NativeAuthStrategyErrorResultFromJson(
        Map<String, dynamic> json) =>
    NativeAuthStrategyErrorResult(
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$NativeAuthStrategyErrorResultToJson(
        NativeAuthStrategyErrorResult instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
    };
