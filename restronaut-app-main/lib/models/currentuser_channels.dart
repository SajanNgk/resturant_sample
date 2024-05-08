import 'package:json_annotation/json_annotation.dart';
part 'currentuser_channels.g.dart';

@JsonSerializable()
class CurrentUserChannel {
  final String id;
  final String token;
  final String code;

  CurrentUserChannel({
    required this.id,
    required this.token,
    required this.code,
  });

  factory CurrentUserChannel.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserChannelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserChannelToJson(this);
}
