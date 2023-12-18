import 'package:app/models/ingredient_state.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_menu_state.freezed.dart';
part 'order_menu_state.g.dart';

@freezed
class OrderMenu with _$OrderMenu {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrderMenu({
    required int id,
    required String name,
    required String description,
    required String imageUrl,
    required Method method,
    required Style style,
    required List<String> specials,
    required double alcPercent,
    required List<Ingredient> ingredients,
    required int stock,
  }) = _OrderMenu;

  factory OrderMenu.fromJson(Map<String, Object?> json) =>
      _$OrderMenuFromJson(json);
}

enum Method {
  stir,
  build,
  shake,
}

enum Style {
  short,
  long,
}
