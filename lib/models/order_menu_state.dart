

import 'package:app/models/ingredient_state.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_menu_state.freezed.dart';
part 'order_menu_state.g.dart';

@freezed
class OrderMenu with _$OrderMenu {
  const factory OrderMenu ({
    required int id,
    required String name,
    required String  discription,
    required Method method,
    required Style style,
    required List<String> special,
    required double alcoholeParcent,
    required List<Ingredient> ingredients,
  }) = _OrderMenu;

  factory OrderMenu.fromJson(Map<String, Object?> json)
    => _$OrderMenuFromJson(json);
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