// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_customer_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCustomerAccountResult _$VerifyCustomerAccountResultFromJson(
        Map<String, dynamic> json) =>
    VerifyCustomerAccountResult(
      errorCode: $enumDecodeNullable(_$ErrorCodeEnumMap, json['errorCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$VerifyCustomerAccountResultToJson(
        VerifyCustomerAccountResult instance) =>
    <String, dynamic>{
      'errorCode': _$ErrorCodeEnumMap[instance.errorCode],
      'message': instance.message,
    };

const _$ErrorCodeEnumMap = {
  ErrorCode.UNKNOWN_ERROR: 'UNKNOWN_ERROR',
  ErrorCode.NATIVE_AUTH_STRATEGY_ERROR: 'NATIVE_AUTH_STRATEGY_ERROR',
  ErrorCode.INVALID_CREDENTIALS_ERROR: 'INVALID_CREDENTIALS_ERROR',
  ErrorCode.ORDER_STATE_TRANSITION_ERROR: 'ORDER_STATE_TRANSITION_ERROR',
  ErrorCode.EMAIL_ADDRESS_CONFLICT_ERROR: 'EMAIL_ADDRESS_CONFLICT_ERROR',
  ErrorCode.GUEST_CHECKOUT_ERROR: 'GUEST_CHECKOUT_ERROR',
  ErrorCode.ORDER_LIMIT_ERROR: 'ORDER_LIMIT_ERROR',
  ErrorCode.NEGATIVE_QUANTITY_ERROR: 'NEGATIVE_QUANTITY_ERROR',
  ErrorCode.INSUFFICIENT_STOCK_ERROR: 'INSUFFICIENT_STOCK_ERROR',
  ErrorCode.COUPON_CODE_INVALID_ERROR: 'COUPON_CODE_INVALID_ERROR',
  ErrorCode.COUPON_CODE_EXPIRED_ERROR: 'COUPON_CODE_EXPIRED_ERROR',
  ErrorCode.COUPON_CODE_LIMIT_ERROR: 'COUPON_CODE_LIMIT_ERROR',
  ErrorCode.ORDER_MODIFICATION_ERROR: 'ORDER_MODIFICATION_ERROR',
  ErrorCode.INELIGIBLE_SHIPPING_METHOD_ERROR:
      'INELIGIBLE_SHIPPING_METHOD_ERROR',
  ErrorCode.NO_ACTIVE_ORDER_ERROR: 'NO_ACTIVE_ORDER_ERROR',
  ErrorCode.ORDER_PAYMENT_STATE_ERROR: 'ORDER_PAYMENT_STATE_ERROR',
  ErrorCode.INELIGIBLE_PAYMENT_METHOD_ERROR: 'INELIGIBLE_PAYMENT_METHOD_ERROR',
  ErrorCode.PAYMENT_FAILED_ERROR: 'PAYMENT_FAILED_ERROR',
  ErrorCode.PAYMENT_DECLINED_ERROR: 'PAYMENT_DECLINED_ERROR',
  ErrorCode.ALREADY_LOGGED_IN_ERROR: 'ALREADY_LOGGED_IN_ERROR',
  ErrorCode.MISSING_PASSWORD_ERROR: 'MISSING_PASSWORD_ERROR',
  ErrorCode.PASSWORD_VALIDATION_ERROR: 'PASSWORD_VALIDATION_ERROR',
  ErrorCode.PASSWORD_ALREADY_SET_ERROR: 'PASSWORD_ALREADY_SET_ERROR',
  ErrorCode.VERIFICATION_TOKEN_INVALID_ERROR:
      'VERIFICATION_TOKEN_INVALID_ERROR',
  ErrorCode.VERIFICATION_TOKEN_EXPIRED_ERROR:
      'VERIFICATION_TOKEN_EXPIRED_ERROR',
  ErrorCode.IDENTIFIER_CHANGE_TOKEN_INVALID_ERROR:
      'IDENTIFIER_CHANGE_TOKEN_INVALID_ERROR',
  ErrorCode.IDENTIFIER_CHANGE_TOKEN_EXPIRED_ERROR:
      'IDENTIFIER_CHANGE_TOKEN_EXPIRED_ERROR',
  ErrorCode.PASSWORD_RESET_TOKEN_INVALID_ERROR:
      'PASSWORD_RESET_TOKEN_INVALID_ERROR',
  ErrorCode.PASSWORD_RESET_TOKEN_EXPIRED_ERROR:
      'PASSWORD_RESET_TOKEN_EXPIRED_ERROR',
  ErrorCode.NOT_VERIFIED_ERROR: 'NOT_VERIFIED_ERROR',
};

VerificationTokenInvalidError _$VerificationTokenInvalidErrorFromJson(
        Map<String, dynamic> json) =>
    VerificationTokenInvalidError(
      errorCode: $enumDecode(_$ErrorCodeEnumMap, json['errorCode']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$VerificationTokenInvalidErrorToJson(
        VerificationTokenInvalidError instance) =>
    <String, dynamic>{
      'errorCode': _$ErrorCodeEnumMap[instance.errorCode],
      'message': instance.message,
    };

VerificationTokenExpiredError _$VerificationTokenExpiredErrorFromJson(
        Map<String, dynamic> json) =>
    VerificationTokenExpiredError(
      errorCode: $enumDecode(_$ErrorCodeEnumMap, json['errorCode']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$VerificationTokenExpiredErrorToJson(
        VerificationTokenExpiredError instance) =>
    <String, dynamic>{
      'errorCode': _$ErrorCodeEnumMap[instance.errorCode],
      'message': instance.message,
    };

MissingPasswordError _$MissingPasswordErrorFromJson(
        Map<String, dynamic> json) =>
    MissingPasswordError(
      errorCode: $enumDecode(_$ErrorCodeEnumMap, json['errorCode']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$MissingPasswordErrorToJson(
        MissingPasswordError instance) =>
    <String, dynamic>{
      'errorCode': _$ErrorCodeEnumMap[instance.errorCode],
      'message': instance.message,
    };

PasswordValidationError _$PasswordValidationErrorFromJson(
        Map<String, dynamic> json) =>
    PasswordValidationError(
      errorCode: $enumDecode(_$ErrorCodeEnumMap, json['errorCode']),
      message: json['message'] as String,
      validationErrorMessage: json['validationErrorMessage'] as String,
    );

Map<String, dynamic> _$PasswordValidationErrorToJson(
        PasswordValidationError instance) =>
    <String, dynamic>{
      'errorCode': _$ErrorCodeEnumMap[instance.errorCode],
      'message': instance.message,
      'validationErrorMessage': instance.validationErrorMessage,
    };

PasswordAlreadySetError _$PasswordAlreadySetErrorFromJson(
        Map<String, dynamic> json) =>
    PasswordAlreadySetError(
      errorCode: $enumDecode(_$ErrorCodeEnumMap, json['errorCode']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$PasswordAlreadySetErrorToJson(
        PasswordAlreadySetError instance) =>
    <String, dynamic>{
      'errorCode': _$ErrorCodeEnumMap[instance.errorCode],
      'message': instance.message,
    };

NativeAuthStrategyError _$NativeAuthStrategyErrorFromJson(
        Map<String, dynamic> json) =>
    NativeAuthStrategyError(
      errorCode: $enumDecode(_$ErrorCodeEnumMap, json['errorCode']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$NativeAuthStrategyErrorToJson(
        NativeAuthStrategyError instance) =>
    <String, dynamic>{
      'errorCode': _$ErrorCodeEnumMap[instance.errorCode],
      'message': instance.message,
    };
