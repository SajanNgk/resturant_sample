// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currentuser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUser _$CurrentUserFromJson(Map<String, dynamic> json) => CurrentUser(
      id: json['id'] as String?,
      identifier: json['identifier'] as String,
      channels: (json['channels'] as List<dynamic>)
          .map((e) => CurrentUserChannel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentUserToJson(CurrentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'channels': instance.channels,
    };
