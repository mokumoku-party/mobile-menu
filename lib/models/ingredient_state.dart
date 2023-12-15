
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_state.freezed.dart';
part 'ingredient_state.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient ({
    required int id,
    required String name,
    double? alcoholeParcent,
    required String unit,
    required double amount,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, Object?> json)
    => _$IngredientFromJson(json);
}