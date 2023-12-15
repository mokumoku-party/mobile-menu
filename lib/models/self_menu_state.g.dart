// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_menu_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelfMenuImpl _$$SelfMenuImplFromJson(Map<String, dynamic> json) =>
    _$SelfMenuImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      alcPercent: json['alc_percent'] as int,
    );

Map<String, dynamic> _$$SelfMenuImplToJson(_$SelfMenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'alc_percent': instance.alcPercent,
    };
