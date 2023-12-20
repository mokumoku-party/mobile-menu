import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_state.freezed.dart';
part 'order_history_state.g.dart';

@freezed
class OrderHistory with _$OrderHistory {
  const factory OrderHistory({
    required int orderId,
    required String name,
    required String imageUrl,
  }) = _OrderHistory;

  factory OrderHistory.fromJson(Map<String, Object?> json) =>
      _$OrderHistoryFromJson(json);
}
