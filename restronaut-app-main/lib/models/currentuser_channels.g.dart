// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currentuser_channels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUserChannel _$CurrentUserChannelFromJson(Map<String, dynamic> json) =>
    CurrentUserChannel(
      id: json['id'] as String,
      token: json['token'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$CurrentUserChannelToJson(CurrentUserChannel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'code': instance.code,
    };
