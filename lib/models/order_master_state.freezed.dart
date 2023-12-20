// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_master_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderMasterState _$OrderMasterStateFromJson(Map<String, dynamic> json) {
  return _OrderMasterState.fromJson(json);
}

/// @nodoc
mixin _$OrderMasterState {
  String get orderId => throw _privateConstructorUsedError;
  String get menuName => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderMasterStateCopyWith<OrderMasterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderMasterStateCopyWith<$Res> {
  factory $OrderMasterStateCopyWith(
          OrderMasterState value, $Res Function(OrderMasterState) then) =
      _$OrderMasterStateCopyWithImpl<$Res, OrderMasterState>;
  @useResult
  $Res call({String orderId, String menuName, Status status});
}

/// @nodoc
class _$OrderMasterStateCopyWithImpl<$Res, $Val extends OrderMasterState>
    implements $OrderMasterStateCopyWith<$Res> {
  _$OrderMasterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? menuName = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderMasterStateImplCopyWith<$Res>
    implements $OrderMasterStateCopyWith<$Res> {
  factory _$$OrderMasterStateImplCopyWith(_$OrderMasterStateImpl value,
          $Res Function(_$OrderMasterStateImpl) then) =
      __$$OrderMasterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId, String menuName, Status status});
}

/// @nodoc
class __$$OrderMasterStateImplCopyWithImpl<$Res>
    extends _$OrderMasterStateCopyWithImpl<$Res, _$OrderMasterStateImpl>
    implements _$$OrderMasterStateImplCopyWith<$Res> {
  __$$OrderMasterStateImplCopyWithImpl(_$OrderMasterStateImpl _value,
      $Res Function(_$OrderMasterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? menuName = null,
    Object? status = null,
  }) {
    return _then(_$OrderMasterStateImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      menuName: null == menuName
          ? _value.menuName
          : menuName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$OrderMasterStateImpl implements _OrderMasterState {
  _$OrderMasterStateImpl(
      {required this.orderId, required this.menuName, required this.status});

  factory _$OrderMasterStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderMasterStateImplFromJson(json);

  @override
  final String orderId;
  @override
  final String menuName;
  @override
  final Status status;

  @override
  String toString() {
    return 'OrderMasterState(orderId: $orderId, menuName: $menuName, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderMasterStateImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.menuName, menuName) ||
                other.menuName == menuName) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, menuName, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderMasterStateImplCopyWith<_$OrderMasterStateImpl> get copyWith =>
      __$$OrderMasterStateImplCopyWithImpl<_$OrderMasterStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderMasterStateImplToJson(
      this,
    );
  }
}

abstract class _OrderMasterState implements OrderMasterState {
  factory _OrderMasterState(
      {required final String orderId,
      required final String menuName,
      required final Status status}) = _$OrderMasterStateImpl;

  factory _OrderMasterState.fromJson(Map<String, dynamic> json) =
      _$OrderMasterStateImpl.fromJson;

  @override
  String get orderId;
  @override
  String get menuName;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$OrderMasterStateImplCopyWith<_$OrderMasterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
