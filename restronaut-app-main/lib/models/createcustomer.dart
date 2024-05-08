import 'package:json_annotation/json_annotation.dart';

part 'createcustomer.g.dart';

@JsonSerializable()
class CreateCustomerInput {
  final String title;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String emailAddress;
  final String password;

  CreateCustomerInput(
      {this.title = "",
      required this.firstName,
      required this.lastName,
      this.phoneNumber = "",
      required this.emailAddress,
      required this.password});
  factory CreateCustomerInput.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomerInputFromJson(json);
  Map<String, dynamic> toJson() => _$CreateCustomerInputToJson(this);
}
