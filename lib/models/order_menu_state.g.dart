// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_menu_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderMenuImpl _$$OrderMenuImplFromJson(Map<String, dynamic> json) =>
    _$OrderMenuImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      method: $enumDecode(_$MethodEnumMap, json['method']),
      style: $enumDecode(_$StyleEnumMap, json['style']),
      specials:
          (json['specials'] as List<dynamic>).map((e) => e as String).toList(),
      alcPercent: (json['alc_percent'] as num).toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      stock: json['stock'] as int,
    );

Map<String, dynamic> _$$OrderMenuImplToJson(_$OrderMenuImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'method': _$MethodEnumMap[instance.method]!,
      'style': _$StyleEnumMap[instance.style]!,
      'specials': instance.specials,
      'alc_percent': instance.alcPercent,
      'ingredients': instance.ingredients,
      'stock': instance.stock,
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
