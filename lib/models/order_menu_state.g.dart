// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_menu_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderMenuImpl _$$OrderMenuImplFromJson(Map<String, dynamic> json) =>
    _$OrderMenuImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      discription: json['discription'] as String,
      method: $enumDecode(_$MethodEnumMap, json['method']),
      style: $enumDecode(_$StyleEnumMap, json['style']),
      special:
          (json['special'] as List<dynamic>).map((e) => e as String).toList(),
      alcoholeParcent: (json['alcoholeParcent'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderMenuImplToJson(_$OrderMenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'discription': instance.discription,
      'method': _$MethodEnumMap[instance.method]!,
      'style': _$StyleEnumMap[instance.style]!,
      'special': instance.special,
      'alcoholeParcent': instance.alcoholeParcent,
      'ingredients': instance.ingredients,
    };

const _$MethodEnumMap = {
  Method.stir: 'stir',
  Method.build: 'build',
  Method.shake: 'shake',
};

const _$StyleEnumMap = {
  Style.short: 'short',
  Style.long: 'long',
};
