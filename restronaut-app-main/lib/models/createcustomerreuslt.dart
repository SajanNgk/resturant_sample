import 'package:json_annotation/json_annotation.dart';

part 'createcustomerreuslt.g.dart';

@JsonSerializable()
class RegisterCustomerAccountResult {
  RegisterCustomerAccountResult();

  factory RegisterCustomerAccountResult.fromJson(Map<String, dynamic> json) =>
      _$RegisterCustomerAccountResultFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCustomerAccountResultToJson(this);
}

@JsonSerializable()
class SuccessResult extends RegisterCustomerAccountResult {
  final bool success;

  SuccessResult({required this.success});

  factory SuccessResult.fromJson(Map<String, dynamic> json) =>
      _$SuccessResultFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessResultToJson(this);
}

@JsonSerializable()
class MissingPasswordErrorResult extends RegisterCustomerAccountResult {
  final String errorMessage;

  MissingPasswordErrorResult({required this.errorMessage});

  factory MissingPasswordErrorResult.fromJson(Map<String, dynamic> json) =>
      _$MissingPasswordErrorResultFromJson(json);

  Map<String, dynamic> toJson() => _$MissingPasswordErrorResultToJson(this);
}

@JsonSerializable()
class PasswordValidationErrorResult extends RegisterCustomerAccountResult {
  final String errorMessage;

  PasswordValidationErrorResult({required this.errorMessage});

  factory PasswordValidationErrorResult.fromJson(Map<String, dynamic> json) =>
      _$PasswordValidationErrorResultFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordValidationErrorResultToJson(this);
}

@JsonSerializable()
class NativeAuthStrategyErrorResult extends RegisterCustomerAccountResult {
  final String errorMessage;

  NativeAuthStrategyErrorResult({required this.errorMessage});

  factory NativeAuthStrategyErrorResult.fromJson(Map<String, dynamic> json) =>
      _$NativeAuthStrategyErrorResultFromJson(json);

  Map<String, dynamic> toJson() => _$NativeAuthStrategyErrorResultToJson(this);
}
