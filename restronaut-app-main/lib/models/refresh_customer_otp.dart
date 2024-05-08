// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hyperce/models/enums.dart';

abstract class RefreshCustomerVerificationResult {}

class Sucess extends RefreshCustomerVerificationResult {
  bool sucess;
  Sucess({
    required this.sucess,
  });
}

class NativeAuthStrategyError extends RefreshCustomerVerificationResult {
  final ErrorCode errorCode;
  final String message;

  NativeAuthStrategyError({required this.errorCode, required this.message});
}
