// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'self_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelfMenu _$SelfMenuFromJson(Map<String, dynamic> json) {
  return _SelfMenu.fromJson(json);
}

/// @nodoc
mixin _$SelfMenu {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get alcPercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelfMenuCopyWith<SelfMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelfMenuCopyWith<$Res> {
  factory $SelfMenuCopyWith(SelfMenu value, $Res Function(SelfMenu) then) =
      _$SelfMenuCopyWithImpl<$Res, SelfMenu>;
  @useResult
  $Res call({int id, String name, String imageUrl, int alcPercent});
}

/// @nodoc
class _$SelfMenuCopyWithImpl<$Res, $Val extends SelfMenu>
    implements $SelfMenuCopyWith<$Res> {
  _$SelfMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? alcPercent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      alcPercent: null == alcPercent
          ? _value.alcPercent
          : alcPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelfMenuImplCopyWith<$Res>
    implements $SelfMenuCopyWith<$Res> {
  factory _$$SelfMenuImplCopyWith(
          _$SelfMenuImpl value, $Res Function(_$SelfMenuImpl) then) =
      __$$SelfMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String imageUrl, int alcPercent});
}

/// @nodoc
class __$$SelfMenuImplCopyWithImpl<$Res>
    extends _$SelfMenuCopyWithImpl<$Res, _$SelfMenuImpl>
    implements _$$SelfMenuImplCopyWith<$Res> {
  __$$SelfMenuImplCopyWithImpl(
      _$SelfMenuImpl _value, $Res Function(_$SelfMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? alcPercent = null,
  }) {
    return _then(_$SelfMenuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      alcPercent: null == alcPercent
          ? _value.alcPercent
          : alcPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SelfMenuImpl with DiagnosticableTreeMixin implements _SelfMenu {
  const _$SelfMenuImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.alcPercent});

  factory _$SelfMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelfMenuImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final int alcPercent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelfMenu(id: $id, name: $name, imageUrl: $imageUrl, alcPercent: $alcPercent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelfMenu'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('alcPercent', alcPercent));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelfMenuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.alcPercent, alcPercent) ||
                other.alcPercent == alcPercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, alcPercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelfMenuImplCopyWith<_$SelfMenuImpl> get copyWith =>
      __$$SelfMenuImplCopyWithImpl<_$SelfMenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelfMenuImplToJson(
      this,
    );
  }
}

abstract class _SelfMenu implements SelfMenu {
  const factory _SelfMenu(
      {required final int id,
      required final String name,
      required final String imageUrl,
      required final int alcPercent}) = _$SelfMenuImpl;

  factory _SelfMenu.fromJson(Map<String, dynamic> json) =
      _$SelfMenuImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  int get alcPercent;
  @override
  @JsonKey(ignore: true)
  _$$SelfMenuImplCopyWith<_$SelfMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
