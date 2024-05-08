import 'package:json_annotation/json_annotation.dart';
part 'emailerrormodel.g.dart';

@JsonSerializable()
class EmailAddressConflictError {
  final String message;

  EmailAddressConflictError({required this.message});
  factory EmailAddressConflictError.fromJson(Map<String, dynamic> json) =>
      _$EmailAddressConflictErrorFromJson(json);
  Map<String, dynamic> toJson() => _$EmailAddressConflictErrorToJson(this);
}
