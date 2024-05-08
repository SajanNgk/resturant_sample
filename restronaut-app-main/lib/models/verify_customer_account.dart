import 'package:hyperce/models/enums.dart';
import 'package:json_annotation/json_annotation.dart';
part 'verify_customer_account.g.dart';

@JsonSerializable()
class VerifyCustomerAccountResult {
  final ErrorCode? errorCode;
  final String? message;

  VerifyCustomerAccountResult({
    this.errorCode,
    this.message,
  });

  factory VerifyCustomerAccountResult.fromJson(Map<String, dynamic> json) =>
      _$VerifyCustomerAccountResultFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCustomerAccountResultToJson(this);
}

@JsonSerializable()
class VerificationTokenInvalidError extends VerifyCustomerAccountResult {
  VerificationTokenInvalidError({
    required ErrorCode errorCode,
    required String message,
  }) : super(
          errorCode: errorCode,
          message: message,
        );

  factory VerificationTokenInvalidError.fromJson(Map<String, dynamic> json) =>
      _$VerificationTokenInvalidErrorFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationTokenInvalidErrorToJson(this);
}

@JsonSerializable()
class VerificationTokenExpiredError extends VerifyCustomerAccountResult {
  VerificationTokenExpiredError({
    required ErrorCode errorCode,
    required String message,
  }) : super(
          errorCode: errorCode,
          message: message,
        );

  factory VerificationTokenExpiredError.fromJson(Map<String, dynamic> json) =>
      _$VerificationTokenExpiredErrorFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationTokenExpiredErrorToJson(this);
}

@JsonSerializable()
class MissingPasswordError extends VerifyCustomerAccountResult {
  MissingPasswordError({
    required ErrorCode errorCode,
    required String message,
  }) : super(
          errorCode: errorCode,
          message: message,
        );

  factory MissingPasswordError.fromJson(Map<String, dynamic> json) =>
      _$MissingPasswordErrorFromJson(json);

  Map<String, dynamic> toJson() => _$MissingPasswordErrorToJson(this);
}

@JsonSerializable()
class PasswordValidationError extends VerifyCustomerAccountResult {
  final String validationErrorMessage;

  PasswordValidationError({
    required ErrorCode errorCode,
    required String message,
    required this.validationErrorMessage,
  }) : super(
          errorCode: errorCode,
          message: message,
        );

  factory PasswordValidationError.fromJson(Map<String, dynamic> json) =>
      _$PasswordValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordValidationErrorToJson(this);
}

@JsonSerializable()
class PasswordAlreadySetError extends VerifyCustomerAccountResult {
  PasswordAlreadySetError({
    required ErrorCode errorCode,
    required String message,
  }) : super(
          errorCode: errorCode,
          message: message,
        );

  factory PasswordAlreadySetError.fromJson(Map<String, dynamic> json) =>
      _$PasswordAlreadySetErrorFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordAlreadySetErrorToJson(this);
}

@JsonSerializable()
class NativeAuthStrategyError extends VerifyCustomerAccountResult {
  NativeAuthStrategyError({
    required ErrorCode errorCode,
    required String message,
  }) : super(
          errorCode: errorCode,
          message: message,
        );

  factory NativeAuthStrategyError.fromJson(Map<String, dynamic> json) =>
      _$NativeAuthStrategyErrorFromJson(json);

  Map<String, dynamic> toJson() => _$NativeAuthStrategyErrorToJson(this);
}
