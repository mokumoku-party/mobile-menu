// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSelfMenuHash() => r'57933d417d7f8826124c2ff834781c0755cfea57';

/// See also [getSelfMenu].
@ProviderFor(getSelfMenu)
final getSelfMenuProvider = FutureProvider<List<SelfMenu>>.internal(
  getSelfMenu,
  name: r'getSelfMenuProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getSelfMenuHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSelfMenuRef = FutureProviderRef<List<SelfMenu>>;
String _$getOrderMenuHash() => r'aaafa2d1a77bfb48cbf4ec2f6bd6565905021aef';

/// See also [getOrderMenu].
@ProviderFor(getOrderMenu)
final getOrderMenuProvider = FutureProvider<List<OrderMenu>>.internal(
  getOrderMenu,
  name: r'getOrderMenuProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getOrderMenuHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetOrderMenuRef = FutureProviderRef<List<OrderMenu>>;
String _$getSecretMenuHash() => r'f57423a1b180a3f08bfc8b5de020fc248fcfaa07';

/// See also [getSecretMenu].
@ProviderFor(getSecretMenu)
final getSecretMenuProvider = FutureProvider<List<OrderMenu>>.internal(
  getSecretMenu,
  name: r'getSecretMenuProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSecretMenuHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSecretMenuRef = FutureProviderRef<List<OrderMenu>>;
String _$getAllOrderHash() => r'd5640748e33713579df607bd06dd521f42097e6b';

/// See also [getAllOrder].
@ProviderFor(getAllOrder)
final getAllOrderProvider = AutoDisposeFutureProvider<List<OrderMenu>>.internal(
  getAllOrder,
  name: r'getAllOrderProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllOrderRef = AutoDisposeFutureProviderRef<List<OrderMenu>>;
String _$getOneOrderMenuHash() => r'ead4ad6ca74e2de073b92975b31fad20a1eb73cc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getOneOrderMenu].
@ProviderFor(getOneOrderMenu)
const getOneOrderMenuProvider = GetOneOrderMenuFamily();

/// See also [getOneOrderMenu].
class GetOneOrderMenuFamily extends Family<AsyncValue<OrderMenu>> {
  /// See also [getOneOrderMenu].
  const GetOneOrderMenuFamily();

  /// See also [getOneOrderMenu].
  GetOneOrderMenuProvider call(
    int menuId,
  ) {
    return GetOneOrderMenuProvider(
      menuId,
    );
  }

  @override
  GetOneOrderMenuProvider getProviderOverride(
    covariant GetOneOrderMenuProvider provider,
  ) {
    return call(
      provider.menuId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getOneOrderMenuProvider';
}

/// See also [getOneOrderMenu].
class GetOneOrderMenuProvider extends AutoDisposeFutureProvider<OrderMenu> {
  /// See also [getOneOrderMenu].
  GetOneOrderMenuProvider(
    int menuId,
  ) : this._internal(
          (ref) => getOneOrderMenu(
            ref as GetOneOrderMenuRef,
            menuId,
          ),
          from: getOneOrderMenuProvider,
          name: r'getOneOrderMenuProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOneOrderMenuHash,
          dependencies: GetOneOrderMenuFamily._dependencies,
          allTransitiveDependencies:
              GetOneOrderMenuFamily._allTransitiveDependencies,
          menuId: menuId,
        );

  GetOneOrderMenuProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.menuId,
  }) : super.internal();

  final int menuId;

  @override
  Override overrideWith(
    FutureOr<OrderMenu> Function(GetOneOrderMenuRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetOneOrderMenuProvider._internal(
        (ref) => create(ref as GetOneOrderMenuRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        menuId: menuId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OrderMenu> createElement() {
    return _GetOneOrderMenuProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOneOrderMenuProvider && other.menuId == menuId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, menuId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetOneOrderMenuRef on AutoDisposeFutureProviderRef<OrderMenu> {
  /// The parameter `menuId` of this provider.
  int get menuId;
}

class _GetOneOrderMenuProviderElement
    extends AutoDisposeFutureProviderElement<OrderMenu>
    with GetOneOrderMenuRef {
  _GetOneOrderMenuProviderElement(super.provider);

  @override
  int get menuId => (origin as GetOneOrderMenuProvider).menuId;
}

String _$getIngredientListHash() => r'413adb048ab2a00038480fccaefe5024ee2bc325';

/// See also [getIngredientList].
@ProviderFor(getIngredientList)
final getIngredientListProvider =
    AutoDisposeFutureProvider<List<Ingredient>>.internal(
  getIngredientList,
  name: r'getIngredientListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getIngredientListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetIngredientListRef = AutoDisposeFutureProviderRef<List<Ingredient>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
