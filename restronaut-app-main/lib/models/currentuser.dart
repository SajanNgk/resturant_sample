import 'package:hyperce/models/currentuser_channels.dart';

import 'package:json_annotation/json_annotation.dart';

part 'currentuser.g.dart';

@JsonSerializable()
class CurrentUser {
  final String? id;
  final String identifier;
  final List<CurrentUserChannel> channels;

  CurrentUser({
    required this.id,
    required this.identifier,
    required this.channels,
  });
  factory CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserToJson(this);
}
