// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderMenu _$OrderMenuFromJson(Map<String, dynamic> json) {
  return _OrderMenu.fromJson(json);
}

/// @nodoc
mixin _$OrderMenu {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get discription => throw _privateConstructorUsedError;
  Method get method => throw _privateConstructorUsedError;
  Style get style => throw _privateConstructorUsedError;
  List<String> get special => throw _privateConstructorUsedError;
  double get alcoholeParcent => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderMenuCopyWith<OrderMenu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderMenuCopyWith<$Res> {
  factory $OrderMenuCopyWith(OrderMenu value, $Res Function(OrderMenu) then) =
      _$OrderMenuCopyWithImpl<$Res, OrderMenu>;
  @useResult
  $Res call(
      {int id,
      String name,
      String discription,
      Method method,
      Style style,
      List<String> special,
      double alcoholeParcent,
      List<Ingredient> ingredients});
}

/// @nodoc
class _$OrderMenuCopyWithImpl<$Res, $Val extends OrderMenu>
    implements $OrderMenuCopyWith<$Res> {
  _$OrderMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? discription = null,
    Object? method = null,
    Object? style = null,
    Object? special = null,
    Object? alcoholeParcent = null,
    Object? ingredients = null,
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
      discription: null == discription
          ? _value.discription
          : discription // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as Method,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Style,
      special: null == special
          ? _value.special
          : special // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alcoholeParcent: null == alcoholeParcent
          ? _value.alcoholeParcent
          : alcoholeParcent // ignore: cast_nullable_to_non_nullable
              as double,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderMenuImplCopyWith<$Res>
    implements $OrderMenuCopyWith<$Res> {
  factory _$$OrderMenuImplCopyWith(
          _$OrderMenuImpl value, $Res Function(_$OrderMenuImpl) then) =
      __$$OrderMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String discription,
      Method method,
      Style style,
      List<String> special,
      double alcoholeParcent,
      List<Ingredient> ingredients});
}

/// @nodoc
class __$$OrderMenuImplCopyWithImpl<$Res>
    extends _$OrderMenuCopyWithImpl<$Res, _$OrderMenuImpl>
    implements _$$OrderMenuImplCopyWith<$Res> {
  __$$OrderMenuImplCopyWithImpl(
      _$OrderMenuImpl _value, $Res Function(_$OrderMenuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? discription = null,
    Object? method = null,
    Object? style = null,
    Object? special = null,
    Object? alcoholeParcent = null,
    Object? ingredients = null,
  }) {
    return _then(_$OrderMenuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      discription: null == discription
          ? _value.discription
          : discription // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as Method,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Style,
      special: null == special
          ? _value._special
          : special // ignore: cast_nullable_to_non_nullable
              as List<String>,
      alcoholeParcent: null == alcoholeParcent
          ? _value.alcoholeParcent
          : alcoholeParcent // ignore: cast_nullable_to_non_nullable
              as double,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderMenuImpl with DiagnosticableTreeMixin implements _OrderMenu {
  const _$OrderMenuImpl(
      {required this.id,
      required this.name,
      required this.discription,
      required this.method,
      required this.style,
      required final List<String> special,
      required this.alcoholeParcent,
      required final List<Ingredient> ingredients})
      : _special = special,
        _ingredients = ingredients;

  factory _$OrderMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderMenuImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String discription;
  @override
  final Method method;
  @override
  final Style style;
  final List<String> _special;
  @override
  List<String> get special {
    if (_special is EqualUnmodifiableListView) return _special;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_special);
  }

  @override
  final double alcoholeParcent;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderMenu(id: $id, name: $name, discription: $discription, method: $method, style: $style, special: $special, alcoholeParcent: $alcoholeParcent, ingredients: $ingredients)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderMenu'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('discription', discription))
      ..add(DiagnosticsProperty('method', method))
      ..add(DiagnosticsProperty('style', style))
      ..add(DiagnosticsProperty('special', special))
      ..add(DiagnosticsProperty('alcoholeParcent', alcoholeParcent))
      ..add(DiagnosticsProperty('ingredients', ingredients));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderMenuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.discription, discription) ||
                other.discription == discription) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.style, style) || other.style == style) &&
            const DeepCollectionEquality().equals(other._special, _special) &&
            (identical(other.alcoholeParcent, alcoholeParcent) ||
                other.alcoholeParcent == alcoholeParcent) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      discription,
      method,
      style,
      const DeepCollectionEquality().hash(_special),
      alcoholeParcent,
      const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderMenuImplCopyWith<_$OrderMenuImpl> get copyWith =>
      __$$OrderMenuImplCopyWithImpl<_$OrderMenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderMenuImplToJson(
      this,
    );
  }
}

abstract class _OrderMenu implements OrderMenu {
  const factory _OrderMenu(
      {required final int id,
      required final String name,
      required final String discription,
      required final Method method,
      required final Style style,
      required final List<String> special,
      required final double alcoholeParcent,
      required final List<Ingredient> ingredients}) = _$OrderMenuImpl;

  factory _OrderMenu.fromJson(Map<String, dynamic> json) =
      _$OrderMenuImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get discription;
  @override
  Method get method;
  @override
  Style get style;
  @override
  List<String> get special;
  @override
  double get alcoholeParcent;
  @override
  List<Ingredient> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$OrderMenuImplCopyWith<_$OrderMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
