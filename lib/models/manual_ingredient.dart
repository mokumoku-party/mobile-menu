import 'package:freezed_annotation/freezed_annotation.dart';

part 'manual_ingredient.freezed.dart';
part 'manual_ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Ingredient({
    required int ingredientId,
    required String unit,
    required double amount,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, Object?> json) =>
      _$IngredientFromJson(json);
}

@freezed
class Ingredients with _$Ingredients {
  const factory Ingredients({
    required List<Ingredient> ingredients,
  }) = _Ingredients;

  factory Ingredients.fromJson(Map<String, Object?> json) =>
      _$IngredientsFromJson(json);
}
