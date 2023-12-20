// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) {
  return _OrderHistory.fromJson(json);
}

/// @nodoc
mixin _$OrderHistory {
  int get orderId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryCopyWith<OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryCopyWith<$Res> {
  factory $OrderHistoryCopyWith(
          OrderHistory value, $Res Function(OrderHistory) then) =
      _$OrderHistoryCopyWithImpl<$Res, OrderHistory>;
  @useResult
  $Res call({int orderId, String name, String imageUrl});
}

/// @nodoc
class _$OrderHistoryCopyWithImpl<$Res, $Val extends OrderHistory>
    implements $OrderHistoryCopyWith<$Res> {
  _$OrderHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryImplCopyWith<$Res>
    implements $OrderHistoryCopyWith<$Res> {
  factory _$$OrderHistoryImplCopyWith(
          _$OrderHistoryImpl value, $Res Function(_$OrderHistoryImpl) then) =
      __$$OrderHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int orderId, String name, String imageUrl});
}

/// @nodoc
class __$$OrderHistoryImplCopyWithImpl<$Res>
    extends _$OrderHistoryCopyWithImpl<$Res, _$OrderHistoryImpl>
    implements _$$OrderHistoryImplCopyWith<$Res> {
  __$$OrderHistoryImplCopyWithImpl(
      _$OrderHistoryImpl _value, $Res Function(_$OrderHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? name = null,
    Object? imageUrl = null,
  }) {
    return _then(_$OrderHistoryImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryImpl implements _OrderHistory {
  const _$OrderHistoryImpl(
      {required this.orderId, required this.name, required this.imageUrl});

  factory _$OrderHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryImplFromJson(json);

  @override
  final int orderId;
  @override
  final String name;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'OrderHistory(orderId: $orderId, name: $name, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, name, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      __$$OrderHistoryImplCopyWithImpl<_$OrderHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryImplToJson(
      this,
    );
  }
}

abstract class _OrderHistory implements OrderHistory {
  const factory _OrderHistory(
      {required final int orderId,
      required final String name,
      required final String imageUrl}) = _$OrderHistoryImpl;

  factory _OrderHistory.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryImpl.fromJson;

  @override
  int get orderId;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
