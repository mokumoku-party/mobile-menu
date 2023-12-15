// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      alcoholeParcent: (json['alcoholeParcent'] as num?)?.toDouble(),
      unit: json['unit'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alcoholeParcent': instance.alcoholeParcent,
      'unit': instance.unit,
      'amount': instance.amount,
    };
