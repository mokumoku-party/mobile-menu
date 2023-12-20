import 'package:app/models/order_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_master_state.freezed.dart';
part 'order_master_state.g.dart';

@freezed
abstract class OrderMasterState with _$OrderMasterState {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory OrderMasterState({
    required String orderId,
    required String menuName,
    required Status status,
  }) = _OrderMasterState;

  factory OrderMasterState.fromJson(Map<String, Object?> json) =>
      _$OrderMasterStateFromJson(json);
}
