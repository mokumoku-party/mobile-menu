import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.freezed.dart';
part 'order_state.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String orderId,
    required String menuName,
    required Status status,

  }) = _Order;

    factory Order.fromJson(Map<String, Object?> json)
      => _$OrderFromJson(json);
}

enum Status {
  processing,
  calling,
}