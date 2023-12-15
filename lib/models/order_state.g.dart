// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderId: json['orderId'] as String,
      menuName: json['menuName'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'menuName': instance.menuName,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.processing: 'processing',
  Status.calling: 'calling',
};
