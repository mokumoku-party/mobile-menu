// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_master_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderMasterStateImpl _$$OrderMasterStateImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderMasterStateImpl(
      orderId: json['order_id'] as String,
      menuName: json['menu_name'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$OrderMasterStateImplToJson(
        _$OrderMasterStateImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'menu_name': instance.menuName,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.processing: 'processing',
  Status.calling: 'calling',
  Status.complete: 'complete',
};
