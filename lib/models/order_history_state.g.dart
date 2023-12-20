// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryImpl _$$OrderHistoryImplFromJson(Map<String, dynamic> json) =>
    _$OrderHistoryImpl(
      orderId: json['orderId'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$OrderHistoryImplToJson(_$OrderHistoryImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
