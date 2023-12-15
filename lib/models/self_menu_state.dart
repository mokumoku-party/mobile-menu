import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'self_menu_state.freezed.dart';
part 'self_menu_state.g.dart';



@freezed
class SelfMenu with _$SelfMenu {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SelfMenu({
    required int id,
    required String name,
    required String imageUrl,
    required int alcPercent,
  }) = _SelfMenu;

    factory SelfMenu.fromJson(Map<String, Object?> json)
      => _$SelfMenuFromJson(json);
}